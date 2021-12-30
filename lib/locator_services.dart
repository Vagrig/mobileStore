import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:way_to_success/core/platform/network_info.dart';
import 'package:way_to_success/features/detail/presentation/bloc/detail_bloc.dart';
import 'package:way_to_success/features/home/data/repositories/home_repository_impl.dart';
import 'package:way_to_success/features/home/domain/repositories/home_repository.dart';
import 'package:way_to_success/features/home/domain/usecases/get_home_items.dart';
import 'package:way_to_success/features/home/presentation/bloc/home_bloc.dart';
import 'features/cart/data/datasource/cart_remote_datasource.dart';
import 'features/cart/data/repositories/cart_repository_impl.dart';
import 'features/cart/domain/repositories/cart_repository.dart';
import 'features/cart/domain/usecases/get_cart_items.dart';
import 'features/cart/presentation/bloc/cart_bloc.dart';
import 'features/detail/data/datasource/detail_remote_datasource.dart';
import 'features/detail/data/repositories/detail_repository_impl.dart';
import 'features/detail/domain/repositories/detail_repository.dart';
import 'features/detail/domain/usecases/get_detail_items.dart';
import 'features/home/data/datasourse/home_remote_datasource.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // BLoC
  sl.registerFactory(() => HomeBloc(getHomeItems: sl()));
  sl.registerFactory(() => DetailBloc(getDetailItems: sl()));
  sl.registerFactory(() => CartBloc(getCartItems: sl()));

  // UseCases
  sl.registerLazySingleton(() => GetHomeItems(itemsRepository: sl()));
  sl.registerLazySingleton(() => GetDetailItems(itemsRepository: sl()));
  sl.registerLazySingleton(() => GetCartItems(itemsRepository: sl()));

  // Repository
  sl.registerLazySingleton<HomeRepository>(
      () => HomeRepositoryImpl(homeDatasource: sl(), networkInfo: sl()));
  sl.registerLazySingleton<DetailRepository>(
      () => DetailRepositoryImpl(detailDatasource: sl(), networkInfo: sl()));
  sl.registerLazySingleton<CartRepository>(
      () => CartRepositoryImpl(cartDatasource: sl(), networkInfo: sl()));

  // Datasource
  sl.registerLazySingleton<HomeRemoteDatasource>(
      () => HomeRemoteDatasourceImpl(client: http.Client()));
  sl.registerLazySingleton<DetailRemoteDatasource>(
      () => DetailRemoteDatasourceImpl(client: http.Client()));
  sl.registerLazySingleton<CartRemoteDatasource>(
      () => CartRemoteDatasourceImpl(client: http.Client()));

  // Core
  sl.registerLazySingleton<NetworkInfo>(
    () => NetworkInfoImpl(sl()),
  );

  sl.registerLazySingleton(() => http.Client);
  sl.registerLazySingleton(() => InternetConnectionChecker());
}
