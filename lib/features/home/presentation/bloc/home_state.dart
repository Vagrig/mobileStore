import 'package:equatable/equatable.dart';
import 'package:way_to_success/features/home/domain/entities/home_entity.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object?> get props => [];
}

class HomeEmptyState extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeLoadedState extends HomeState {
  final List<HomeEntity> loadedItems;

  HomeLoadedState({required this.loadedItems});

  @override
  List<Object?> get props => [loadedItems];
}

class HomeErrorState extends HomeState {
  final String message;

  HomeErrorState({required this.message});

  @override
  List<Object?> get props => [message];
}
