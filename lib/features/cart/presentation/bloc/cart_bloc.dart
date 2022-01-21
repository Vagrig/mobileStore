import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:way_to_success/common/variables/app_variables.dart';
import 'package:way_to_success/core/error/failure.dart';
import 'package:way_to_success/features/cart/domain/usecases/get_cart_items.dart';
import 'package:way_to_success/features/cart/presentation/bloc/cart_event.dart';
import 'package:way_to_success/features/cart/presentation/bloc/cart_state.dart';

const SERVER_FAILURE_MESSAGE = 'Server Failure';
const UNKNOWN_ERROR = 'Unknown Error';

class CartBloc extends Bloc<CartEvent, CartState> {
  final GetCartItems getCartItems;

  CartBloc({required this.getCartItems}) : super(CartEmptyState()) {
    on<CartScreenEvent>(_onEvent);
  }

  Future<void> _onEvent(CartScreenEvent event, Emitter<CartState> emit) async {
    emit(CartLoadingState());
    final failureOrItems =
        await getCartItems.call(PathCartParams(path: AppVariables.cart));
    emit(
      failureOrItems.fold(
        (failure) => CartErrorState(message: _mapFailureToMessage(failure)),
        (items) => CartLoadedState(loadedItems: items),
      ),
    );
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return SERVER_FAILURE_MESSAGE;
      default:
        return UNKNOWN_ERROR;
    }
  }
}
