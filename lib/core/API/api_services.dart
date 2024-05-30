import 'dart:io';
import 'package:dio/dio.dart';
import 'package:promina/core/local_storage/hive_keys.dart';
import 'package:promina/core/local_storage/user_storage.dart';
import 'package:promina/features/Home/data/models/GalleryModel.dart';
import '../../features/Auth/data/models/LoginModel.dart';
import '../../features/Home/data/models/UploadModel.dart';
import '../dio_helper/dio_helper.dart';
import '../end_points/end_points.dart';
import '../error_handeller/exceptions.dart';
import '../shared_preferances/cache_helper.dart';

abstract class ApiService {
  Future<LoginModel> userLogin(
      {required String email, required String password});

  Future<UploadModel> uploadImg({required File? image});

  Future<GalleryModel> getMyGallery();
}

class ApiServiceImpl implements ApiService {
  @override
  Future<LoginModel> userLogin(
      {required String email, required String password}) async {
    try {
      FormData formData = FormData.fromMap({
        'email': email,
        'password': password,
      });
      final response =
          await DioHelperImpl().postData(url: EndPoints.LOGIN, data: formData);
      if (response.statusCode == 200) {
        LoginModel model = LoginModel.fromJson(response.data);
        return model;
      } else {
        throw ServerException();
      }
    } on DioException catch (e) {
      rethrow;
    }
  }

  @override
  Future<UploadModel> uploadImg({required File? image}) async {
    try {
      FormData formData = FormData.fromMap({
        'img': await MultipartFile.fromFile(image!.path, filename: 'image.jpg'),
      });
      final response = await DioHelperImpl().postData(
          url: EndPoints.UPLOAD,
          token: CacheHelper.getData(key: 'token'),
          data: formData);
      if (response.statusCode == 200) {
        UploadModel model = UploadModel.fromJson(response.data);
        return model;
      } else {
        throw ServerException();
      }
    } on DioException catch (e) {
      print(e.error.toString());
      rethrow;
    }
  }

  @override
  Future<GalleryModel> getMyGallery() async {
    try {
      final response = await DioHelperImpl().getData(
          url: EndPoints.GALLERY, token: CacheHelper.getData(key: 'token'));

      if (response.statusCode == 200) {
        GalleryModel model = GalleryModel.fromJson(response.data);
        return model;
      } else {
        throw ServerException();
      }
    } on DioException catch (e) {
      print(e.error.toString());
      rethrow;
    }
  }
}
