import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:way_to_success/core/error/failure.dart';
import 'package:way_to_success/core/usecases/usecases.dart';
import 'package:way_to_success/features/detail/domain/entities/detail_entity.dart';
import 'package:way_to_success/features/detail/domain/repositories/detail_repository.dart';

class GetDetailItems extends UseCase<List<DetailEntity>, PathDetailParams> {
  final DetailRepository itemsRepository;

  GetDetailItems({required this.itemsRepository});

  @override
  Future<Either<Failure, List<DetailEntity>>> call(
      PathDetailParams params) async {
    return await itemsRepository.getDetailItems(params.path);
  }
}

class PathDetailParams extends Equatable {
  final String path;
  PathDetailParams({required this.path});

  @override
  List<Object?> get props => [];
}
