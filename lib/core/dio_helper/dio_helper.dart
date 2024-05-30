import 'package:dio/dio.dart';

abstract class DioHelper {
  void init();

  Future<Response> getData({
    required String url,
    Map<String, dynamic>? query,
    String? token,
  });

  Future<Response> postData({
    required String url,
    required FormData data,
    Map<String, dynamic>? query,
    String? token,
  });

  Future<Response> putData({
    required String url,
    required Map<String, dynamic> data,
    Map<String, dynamic>? query,
    String? token,
  });
}

class DioHelperImpl implements DioHelper {
  static Dio? dio;

  @override
  void init() {
    dio = Dio(BaseOptions(
        baseUrl: 'https://flutter.prominaagency.com/api/',
        receiveDataWhenStatusError: true,
        headers: {'Content-Type': 'application/json'}));
    dio!.options.followRedirects = true;
  }

  @override
  Future<Response> getData(
      {required String url, Map<String, dynamic>? query, String? token}) async {
    dio!.options.headers['Authorization'] = 'Bearer $token';
    return await dio!.get(url, queryParameters: query);
  }

  @override
  Future<Response> postData(
      {required String url,
      required FormData data,
      Map<String, dynamic>? query,
      String? token}) async {
    dio!.options.headers['Authorization'] = 'Bearer $token';

    return await dio!.post(url, data: data);
  }

  @override
  Future<Response> putData(
      {required String url,
      required Map<String, dynamic> data,
      Map<String, dynamic>? query,
      String? token}) async {
    dio!.options.headers = {
      'Content-Type': 'application/json',
      'Authorization': token ?? '',
    };
    return await dio!.put(url, data: data);
  }
}
