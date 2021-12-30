import 'package:dartz/dartz.dart';
import 'package:way_to_success/core/error/failure.dart';
import 'package:way_to_success/features/home/domain/entities/home_entity.dart';

abstract class HomeRepository {
  Future<Either<Failure, List<HomeEntity>>> getHomeItems(String path);
}
