import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:gold_pricing/core/networking/api_constants.dart';
import 'package:gold_pricing/core/networking/dio_helper.dart';
import 'package:gold_pricing/feature/home/data/repository/metal_repo.dart';

final getIt = GetIt.instance;

void dioSetupServiceLocator() {
  getIt.registerLazySingleton<Dio>(
    () => Dio(
      BaseOptions(
        baseUrl: ApiConstants.baseUrl,
        receiveTimeout: const Duration(seconds: 20),
        connectTimeout: const Duration(seconds: 20),
        receiveDataWhenStatusError: true,
        headers: {"Accept": "application/json", "User-Agent": "Mozilla/5.0 "},
      ),
    ),
  );

  getIt.registerLazySingleton<DioHelper>(() => DioHelper(getIt<Dio>()));
  getIt.registerLazySingleton<MetalRepo>(() => MetalRepo(getIt<DioHelper>()));
}
