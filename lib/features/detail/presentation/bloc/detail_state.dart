import 'package:equatable/equatable.dart';
import 'package:way_to_success/features/detail/domain/entities/detail_entity.dart';

abstract class DetailState extends Equatable {
  const DetailState();

  @override
  List<Object?> get props => [];
}

class DetailEmptyState extends DetailState {}

class DetailLoadingState extends DetailState {}

class DetailLoadedState extends DetailState {
  final List<DetailEntity> loadedItems;

  DetailLoadedState({required this.loadedItems});

  @override
  List<Object?> get props => [loadedItems];
}

class DetailErrorState extends DetailState {
  final String message;

  DetailErrorState({required this.message});

  @override
  List<Object?> get props => [message];
}
