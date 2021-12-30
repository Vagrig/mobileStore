import 'package:way_to_success/core/error/exception.dart';
import 'package:way_to_success/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:way_to_success/core/platform/network_info.dart';
import 'package:way_to_success/features/cart/data/datasource/cart_remote_datasource.dart';
import 'package:way_to_success/features/cart/domain/entities/cart_entity.dart';
import 'package:way_to_success/features/cart/domain/repositories/cart_repository.dart';

class CartRepositoryImpl implements CartRepository {
  final CartRemoteDatasource cartDatasource;
  final NetworkInfo networkInfo;

  CartRepositoryImpl({required this.cartDatasource, required this.networkInfo});

  @override
  Future<Either<Failure, List<CartEntity>>> getCartItems(String path) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteItems = await cartDatasource.getItems(path);
        return Right(remoteItems);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(ServerFailure());
    }
  }
}
