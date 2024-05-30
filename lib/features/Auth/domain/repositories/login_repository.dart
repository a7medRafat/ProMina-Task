import 'package:dartz/dartz.dart';
import '../../../../core/error_handeller/failures.dart';
import '../../data/models/LoginModel.dart';

abstract class LoginRepository {

  Future<Either<Failure, LoginModel>> userLogin(
      {required String email, required String password});
}
