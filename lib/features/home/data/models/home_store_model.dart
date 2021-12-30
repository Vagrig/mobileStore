import 'package:way_to_success/features/home/domain/entities/home_entity.dart';

class HomeStoreModel extends HomeStoreEntity {
  HomeStoreModel({
    required id,
    required isNew,
    required isFavorites,
    required title,
    required subtitle,
    required picture,
    required isBuy,
  }) : super(
          id: id,
          isNew: isNew,
          isFavorites: isFavorites,
          title: title,
          subtitle: subtitle,
          picture: picture,
          isBuy: isBuy,
        );
  factory HomeStoreModel.fromJson(Map<String, dynamic> json) {
    return HomeStoreModel(
      id: json['id'] as int,
      isNew: json['is_new'],
      isFavorites: json['is_favorites'],
      title: json['title'] as String,
      subtitle: json['subtitle'] as String,
      picture: json['picture'] as String,
      isBuy: json['is_buy'] as bool,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'isNew': isNew,
      'isFavorites': isFavorites,
      'title': title,
      'subtitle': subtitle,
      'picture': picture,
      'isBuy': isBuy,
    };
  }
}
