import 'package:dio/dio.dart';

class ErrorInterceptor extends Interceptor {
  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    // Handle error here
    switch (err.type) {
      case DioErrorType.connectionTimeout:
        print('Connection Timeout Exception');
        break;
      case DioErrorType.sendTimeout:
        print('Send Timeout Exception');
        break;
      case DioErrorType.receiveTimeout:
        print('Receive Timeout Exception');
        break;
      case DioErrorType.badResponse:
        print('Received invalid status code: ${err.response?.statusCode}');
        break;
      case DioErrorType.cancel:
        print('Request to API server was cancelled');
        break;
      case DioErrorType.unknown:
        print('Unexpected error: $err');
        break;
      case DioExceptionType.badCertificate:
        print('Bad Status: $err');
        break;
      case DioExceptionType.connectionError:
        print('Unexpected error: $err');
    }

    // Continue the error flow
    handler.next(err);
  }
}
