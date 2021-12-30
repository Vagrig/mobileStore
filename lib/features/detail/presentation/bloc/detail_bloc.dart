import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:way_to_success/core/error/failure.dart';
import 'package:way_to_success/features/detail/domain/usecases/get_detail_items.dart';
import 'package:way_to_success/features/detail/presentation/bloc/detail_state.dart';
import 'detail_event.dart';

const SERVER_FAILURE_MESSAGE = 'Server Failure';

class DetailBloc extends Bloc<DetailEvent, DetailState> {
  final GetDetailItems getDetailItems;

  DetailBloc({required this.getDetailItems}) : super(DetailEmptyState()) {
    on<DetailScreenEvent>(_onEvent);
  }

  Future<void> _onEvent(
      DetailScreenEvent event, Emitter<DetailState> emit) async {
    emit(DetailLoadingState());
    final failureOrItems =
        await getDetailItems.call(PathDetailParams(path: 'productdetails'));
    emit(
      failureOrItems.fold(
        (failure) => DetailErrorState(message: _mapFailureToMessage(failure)),
        (items) => DetailLoadedState(loadedItems: items),
      ),
    );
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return SERVER_FAILURE_MESSAGE;
      default:
        return 'Unexpected Error';
    }
  }
}
