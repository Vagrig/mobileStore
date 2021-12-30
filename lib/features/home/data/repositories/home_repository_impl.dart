import 'package:way_to_success/core/error/exception.dart';
import 'package:way_to_success/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:way_to_success/core/platform/network_info.dart';
import 'package:way_to_success/features/home/data/datasourse/home_remote_datasource.dart';
import 'package:way_to_success/features/home/domain/entities/home_entity.dart';
import 'package:way_to_success/features/home/domain/repositories/home_repository.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeRemoteDatasource homeDatasource;
  final NetworkInfo networkInfo;

  HomeRepositoryImpl({
    required this.homeDatasource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, List<HomeEntity>>> getHomeItems(String path) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteItems = await homeDatasource.getItems(path);
        return Right(remoteItems);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(ServerFailure());
    }
  }
}
