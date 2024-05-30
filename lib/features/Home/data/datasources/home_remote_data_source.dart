import 'dart:io';
import 'package:promina/features/Home/data/models/GalleryModel.dart';

import '../../../../core/API/api_services.dart';
import '../models/UploadModel.dart';

abstract class HomeRemoteDataSource {
  Future<UploadModel> uploadImg({required File? image});

  Future<GalleryModel> getMyGallery();
}

class HomeRemoteDataSourceImpl extends HomeRemoteDataSource {
  final ApiService apiService;

  HomeRemoteDataSourceImpl({required this.apiService});

  @override
  Future<UploadModel> uploadImg({required File? image}) async {
    return await apiService.uploadImg(image: image);
  }

  @override
  Future<GalleryModel> getMyGallery()async {
    return await apiService.getMyGallery();
  }
}
