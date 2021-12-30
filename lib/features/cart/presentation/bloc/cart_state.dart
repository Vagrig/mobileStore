import 'package:equatable/equatable.dart';
import 'package:way_to_success/features/cart/domain/entities/cart_entity.dart';

abstract class CartState extends Equatable {
  const CartState();

  @override
  List<Object?> get props => [];
}

class CartEmptyState extends CartState {}

class CartLoadingState extends CartState {}

class CartLoadedState extends CartState {
  final List<CartEntity> loadedItems;

  CartLoadedState({required this.loadedItems});

  @override
  List<Object?> get props => [loadedItems];
}

class CartErrorState extends CartState {
  final String message;

  CartErrorState({required this.message});

  @override
  List<Object?> get props => [message];
}
