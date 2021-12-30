import 'package:equatable/equatable.dart';

class CartEntity extends Equatable {
  final String id;
  final List<BasketEntity> basket;
  final int total;
  final String delivery;

  CartEntity({
    required this.id,
    required this.basket,
    required this.total,
    required this.delivery,
  });

  @override
  List<Object?> get props => [];
}

class BasketEntity {
  final String title;
  final String image;
  final int price;

  BasketEntity({
    required this.title,
    required this.image,
    required this.price,
  });
}
