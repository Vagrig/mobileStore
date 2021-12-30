import 'package:way_to_success/features/cart/data/models/basket_model.dart';
import 'package:way_to_success/features/cart/domain/entities/cart_entity.dart';

class CartModel extends CartEntity {
  CartModel({
    required id,
    required basket,
    required total,
    required delivery,
  }) : super(
          id: id,
          basket: basket,
          total: total,
          delivery: delivery,
        );
  factory CartModel.fromJson(Map<String, dynamic> json) {
    return CartModel(
        id: json['_id'] as String,
        basket: (json['basket'] as List<dynamic>)
            .map((e) => BasketModel.fromJson(e))
            .toList(),
        total: json['total'] as int,
        delivery: json['Delivery'] as String);
  }
}
