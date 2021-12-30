import 'package:dartz/dartz.dart';
import 'package:way_to_success/core/error/failure.dart';
import 'package:way_to_success/features/detail/domain/entities/detail_entity.dart';

abstract class DetailRepository {
  Future<Either<Failure, List<DetailEntity>>> getDetailItems(String path);
}
