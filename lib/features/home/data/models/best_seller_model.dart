import 'package:way_to_success/features/home/domain/entities/home_entity.dart';

class BestSellerModel extends BestSellerEntity {
  BestSellerModel({
    required id,
    required isFavorites,
    required title,
    required price,
    required discountPrice,
    required picture,
  }) : super(
          id: id,
          isFavorites: isFavorites,
          title: title,
          price: price,
          discountPrice: discountPrice,
          picture: picture,
        );

  factory BestSellerModel.fromJson(Map<String, dynamic> json) {
    return BestSellerModel(
      id: json['id'] as int,
      isFavorites: json['is_favorites'] as bool,
      title: json['title'] as String,
      price: json['price_without_discount'] as int,
      discountPrice: json['discount_price'] as int,
      picture: json['picture'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'isFavorites': isFavorites,
      'title': title,
      'price_without_discount': price,
      'discount_price': discountPrice,
      'picture': picture,
    };
  }
}
