import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:promina/core/error_handeller/failures.dart';
import 'package:promina/features/Home/data/datasources/home_remote_data_source.dart';
import 'package:promina/features/Home/data/models/GalleryModel.dart';
import 'package:promina/features/Home/data/models/UploadModel.dart';
import 'package:promina/features/Home/domain/repositories/home_repository.dart';

import '../../../../core/network/network_info.dart';

class HomeRepositoryImpl extends HomeRepository {
  HomeRepositoryImpl(
      {required this.networkInfo, required this.remoteDataSource});

  final NetworkInfo networkInfo;
  final HomeRemoteDataSource remoteDataSource;

  @override
  Future<Either<Failure, UploadModel>> uploadImg({required File? image}) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await remoteDataSource.uploadImg(image: image);
        return right(response);
      } on DioException catch (e) {
        print(e.toString());
        return left(ServerFailure(error: e));
      }
    } else {
      return left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure, GalleryModel>> getMyGallery() async {
    if (await networkInfo.isConnected) {
      try {
        final response = await remoteDataSource.getMyGallery();
        return right(response);
      } on DioException catch (e) {
        print(e.toString());
        return left(ServerFailure(error: e));
      }
    } else {
      return left(OfflineFailure());
    }
  }
}
