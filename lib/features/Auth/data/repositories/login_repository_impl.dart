import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:promina/core/error_handeller/failures.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/repositories/login_repository.dart';
import '../datasources/login_remote_data_source.dart';
import '../models/LoginModel.dart';

class LoginRepositoryImpl extends LoginRepository {
  final NetworkInfo networkInfo;
  final LoginRemoteDataSource remoteDataSource;

  LoginRepositoryImpl(
      {required this.networkInfo, required this.remoteDataSource});

  @override
  Future<Either<Failure, LoginModel>> userLogin(
      {required String email, required String password}) async {
    if (await networkInfo.isConnected) {
      try {
        final response =
            await remoteDataSource.userLogin(email: email, password: password);
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
