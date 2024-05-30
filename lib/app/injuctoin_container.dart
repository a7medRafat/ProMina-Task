import 'dart:ffi';

import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:promina/core/API/api_services.dart';
import 'package:promina/features/Home/cubit/gallery_cubit.dart';
import 'package:promina/features/Home/data/datasources/home_remote_data_source.dart';
import 'package:promina/features/Home/data/repositories/home_repository_impl.dart';
import 'package:promina/features/Home/domain/usecases/get_my_gallery_usecase.dart';
import 'package:promina/features/Home/domain/usecases/upload_img_usecase.dart';
import '../core/network/network_info.dart';
import '../features/Auth/cubit/login_cubit.dart';
import '../features/Auth/data/datasources/login_remote_data_source.dart';
import '../features/Auth/data/repositories/login_repository_impl.dart';
import '../features/Auth/domain/repositories/login_repository.dart';
import '../features/Auth/domain/usecases/login_usecase.dart';
import '../features/Home/domain/repositories/home_repository.dart';

GetIt sl = GetIt.instance;

Future<void> init() async {
  // onboarding //
  sl.registerLazySingleton<LoginCubit>(() => LoginCubit(loginUseCase: sl()));
  sl.registerLazySingleton<LoginUseCase>(
      () => LoginUseCase(loginRepository: sl()));

  sl.registerLazySingleton<LoginRepository>(
      () => LoginRepositoryImpl(networkInfo: sl(), remoteDataSource: sl()));

  sl.registerLazySingleton<LoginRemoteDataSource>(
      () => LoginRemoteDataSourceImpl(apiService: sl()));

  sl.registerLazySingleton<ApiService>(() => ApiServiceImpl());

  sl.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(connectionChecker: sl()));

  sl.registerLazySingleton(() => InternetConnectionChecker());

  // gallery //
  sl.registerLazySingleton<GalleryCubit>(
      () => GalleryCubit(uploadImgUseCase: sl(), myGalleryUseCase: sl()));
  sl.registerLazySingleton<UploadImgUseCase>(
      () => UploadImgUseCase(homeRepository: sl()));

  sl.registerLazySingleton<HomeRepository>(
      () => HomeRepositoryImpl(networkInfo: sl(), remoteDataSource: sl()));

  sl.registerLazySingleton<HomeRemoteDataSource>(
      () => HomeRemoteDataSourceImpl(apiService: sl()));

  sl.registerLazySingleton<GetMyGalleryUseCase>(
      () => GetMyGalleryUseCase(homeRepository: sl()));

}
