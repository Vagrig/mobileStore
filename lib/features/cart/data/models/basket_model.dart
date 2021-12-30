import 'package:way_to_success/features/cart/domain/entities/cart_entity.dart';

class BasketModel extends BasketEntity {
  BasketModel({
    required title,
    required image,
    required price,
  }) : super(
          title: title,
          image: image,
          price: price,
        );
  factory BasketModel.fromJson(Map<String, dynamic> json) {
    return BasketModel(
        title: json['title'] as String,
        image: json['image'] as String,
        price: json['price'] as int);
  }
}
