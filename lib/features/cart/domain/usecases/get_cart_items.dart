import 'package:equatable/equatable.dart';
import 'package:way_to_success/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:way_to_success/core/usecases/usecases.dart';
import 'package:way_to_success/features/cart/domain/entities/cart_entity.dart';
import 'package:way_to_success/features/cart/domain/repositories/cart_repository.dart';

class GetCartItems extends UseCase<List<CartEntity>, PathCartParams> {
  final CartRepository itemsRepository;

  GetCartItems({required this.itemsRepository});
  @override
  Future<Either<Failure, List<CartEntity>>> call(params) async {
    return await itemsRepository.getCartItems(params.path);
  }
}

class PathCartParams extends Equatable {
  final String path;

  PathCartParams({required this.path});

  @override
  List<Object?> get props => [];
}
