import 'package:equatable/equatable.dart';

class HomeEntity extends Equatable {
  final String id;
  final List<HomeStoreEntity> homeStore;
  final List<BestSellerEntity> bestSeller;

  HomeEntity({
    required this.id,
    required this.homeStore,
    required this.bestSeller,
  });

  @override
  List<Object?> get props => [
        id,
        homeStore,
        bestSeller,
      ];
}

class HomeStoreEntity {
  final int id;
  final bool? isNew;
  final bool? isFavorites;
  final String title;
  final String subtitle;
  final String picture;
  final bool isBuy;

  HomeStoreEntity({
    required this.id,
    required this.isNew,
    required this.isFavorites,
    required this.title,
    required this.subtitle,
    required this.picture,
    required this.isBuy,
  });
}

class BestSellerEntity {
  final int id;
  final bool isFavorites;
  final String title;
  final int price;
  final int discountPrice;
  final String picture;

  BestSellerEntity({
    required this.id,
    required this.isFavorites,
    required this.title,
    required this.price,
    required this.discountPrice,
    required this.picture,
  });
}
