import 'package:way_to_success/features/cart/domain/entities/cart_entity.dart';

class BasketModel extends BasketEntity {
  BasketModel({
    required id,
    required title,
    required images,
    required price,
  }) : super(
          id: id,
          title: title,
          images: images,
          price: price,
        );
  factory BasketModel.fromJson(Map<String, dynamic> json) {
    return BasketModel(
        id: json['id'] as int,
        title: json['title'] as String,
        images: json['images'] as String,
        price: json['price'] as int);
  }
}
