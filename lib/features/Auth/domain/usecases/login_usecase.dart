import 'package:dartz/dartz.dart';
import '../../../../../core/error_handeller/failures.dart';
import '../../data/models/LoginModel.dart';
import '../repositories/login_repository.dart';

class LoginUseCase {
  final LoginRepository loginRepository;

  LoginUseCase({required this.loginRepository});

  Future<Either<Failure, LoginModel>> call(
      {required String email, required String password}) async {
    return await loginRepository.userLogin(email: email, password: password);
  }
}
