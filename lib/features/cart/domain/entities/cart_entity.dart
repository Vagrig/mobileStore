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
  final int id;
  final String title;
  final String images;
  final int price;

  BasketEntity({
    required this.id,
    required this.title,
    required this.images,
    required this.price,
  });
}
