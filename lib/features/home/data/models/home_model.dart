import 'package:way_to_success/features/home/data/models/best_seller_model.dart';
import 'package:way_to_success/features/home/data/models/home_store_model.dart';
import 'package:way_to_success/features/home/domain/entities/home_entity.dart';

class HomeModel extends HomeEntity {
  HomeModel({
    required id,
    required homeStore,
    required bestSeller,
  }) : super(
          id: id,
          homeStore: homeStore,
          bestSeller: bestSeller,
        );
  factory HomeModel.fromJson(Map<String, dynamic> json) {
    return HomeModel(
      id: json['_id'] as String,
      homeStore: (json['home_store'] as List<dynamic>)
          .map((e) => HomeStoreModel.fromJson(e))
          .toList(),
      bestSeller: (json['best_seller'] as List<dynamic>)
          .map((e) => BestSellerModel.fromJson(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'home_store': homeStore,
      'best_seller': bestSeller,
    };
  }
}
