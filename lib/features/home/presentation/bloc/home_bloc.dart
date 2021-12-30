import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:way_to_success/core/error/failure.dart';
import 'package:way_to_success/features/home/domain/usecases/get_home_items.dart';
import 'package:way_to_success/features/home/presentation/bloc/home_event.dart';
import 'package:way_to_success/features/home/presentation/bloc/home_state.dart';

const SERVER_FAILURE_MESSAGE = 'Server Failure';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetHomeItems getHomeItems;

  HomeBloc({required this.getHomeItems}) : super(HomeEmptyState()) {
    on<HomeScreenEvent>(_onEvent);
  }

  Future<void> _onEvent(HomeScreenEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoadingState());
    final failureOrItems =
        await getHomeItems.call(PathHomeParams(path: 'main'));
    emit(
      failureOrItems.fold(
        (failure) => HomeErrorState(message: _mapFailureToMessage(failure)),
        (items) => HomeLoadedState(loadedItems: items),
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
