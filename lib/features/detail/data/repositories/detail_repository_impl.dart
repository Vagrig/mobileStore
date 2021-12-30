import 'package:way_to_success/core/error/exception.dart';
import 'package:way_to_success/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:way_to_success/core/platform/network_info.dart';
import 'package:way_to_success/features/detail/data/datasource/detail_remote_datasource.dart';
import 'package:way_to_success/features/detail/domain/entities/detail_entity.dart';
import 'package:way_to_success/features/detail/domain/repositories/detail_repository.dart';

class DetailRepositoryImpl implements DetailRepository {
  final DetailRemoteDatasource detailDatasource;
  final NetworkInfo networkInfo;

  DetailRepositoryImpl({
    required this.detailDatasource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, List<DetailEntity>>> getDetailItems(
      String path) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteItems = await detailDatasource.getItems(path);
        return Right(remoteItems);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(ServerFailure());
    }
  }
}
