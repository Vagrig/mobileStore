import 'package:dartz/dartz.dart';
import 'package:way_to_success/core/error/failure.dart';
import 'package:way_to_success/features/cart/domain/entities/cart_entity.dart';

abstract class CartRepository {
  Future<Either<Failure, List<CartEntity>>> getCartItems(String path);
}
