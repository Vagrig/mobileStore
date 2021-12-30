import 'package:equatable/equatable.dart';

class DetailEntity extends Equatable {
  final String? id;
  final List<dynamic>? images;
  final bool? isFavorites;
  final String? title;
  final double? rating;
  final String? cpu;
  final String? camera;
  final String? ssd;
  final String? sd;
  final List<dynamic>? color;
  final List<dynamic>? capacity;
  final int? price;

  DetailEntity({
    required this.isFavorites,
    required this.title,
    required this.rating,
    required this.cpu,
    required this.camera,
    required this.ssd,
    required this.sd,
    required this.color,
    required this.price,
    required this.id,
    required this.images,
    required this.capacity,
  });

  @override
  List<Object?> get props => [
        isFavorites,
        title,
        rating,
        cpu,
        camera,
        ssd,
        sd,
        color,
        price,
        id,
        images,
        capacity,
      ];
}
