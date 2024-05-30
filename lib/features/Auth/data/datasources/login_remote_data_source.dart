import '../../../../core/API/api_services.dart';
import '../models/LoginModel.dart';

abstract class LoginRemoteDataSource {
  Future<LoginModel> userLogin({required String email, required String password});
}

class LoginRemoteDataSourceImpl extends LoginRemoteDataSource {
  final ApiService apiService;

  LoginRemoteDataSourceImpl({required this.apiService});

  @override
  Future<LoginModel> userLogin(
      {required String email, required String password}) async {
    return await apiService.userLogin(email: email, password: password);
  }
}
