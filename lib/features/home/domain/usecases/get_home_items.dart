import 'package:equatable/equatable.dart';
import 'package:way_to_success/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:way_to_success/core/usecases/usecases.dart';
import 'package:way_to_success/features/home/domain/entities/home_entity.dart';
import 'package:way_to_success/features/home/domain/repositories/home_repository.dart';

class GetHomeItems extends UseCase<List<HomeEntity>, PathHomeParams> {
  final HomeRepository itemsRepository;

  GetHomeItems({required this.itemsRepository});

  @override
  Future<Either<Failure, List<HomeEntity>>> call(PathHomeParams params) async {
    return await itemsRepository.getHomeItems(params.path);
  }
}

class PathHomeParams extends Equatable {
  final String path;

  PathHomeParams({required this.path});

  @override
  List<Object?> get props => [];
}
