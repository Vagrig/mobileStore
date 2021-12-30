import 'package:way_to_success/features/detail/domain/entities/detail_entity.dart';

class DetailModel extends DetailEntity {
  DetailModel({
    required id,
    required images,
    required isFavorites,
    required title,
    required rating,
    required cpu,
    required camera,
    required ssd,
    required sd,
    required color,
    required capacity,
    required price,
  }) : super(
          id: id,
          images: images,
          isFavorites: isFavorites,
          title: title,
          rating: rating,
          cpu: cpu,
          camera: camera,
          ssd: ssd,
          sd: sd,
          color: color,
          capacity: capacity,
          price: price,
        );
  factory DetailModel.fromJson(Map<String, dynamic> json) {
    return DetailModel(
      id: json['_id'],
      images: json['images'],
      isFavorites: json['is_favorites'],
      title: json['title'],
      rating: json['rating'],
      cpu: json['CPU'],
      camera: json['camera'],
      ssd: json['ssd'],
      sd: json['sd'],
      color: json['color'],
      capacity: json['capacity'],
      price: json['price'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'images': images,
      'is_favorites': isFavorites,
      'title': title,
      'rating': rating,
      'cpu': cpu,
      'camera': camera,
      'ssd': ssd,
      'sd': sd,
      'color': color,
      'capacity': capacity,
      'price': price,
    };
  }
}
