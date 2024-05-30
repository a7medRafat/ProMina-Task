import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:promina/features/Auth/cubit/login_states.dart';
import 'package:promina/features/Auth/data/models/LoginModel.dart';
import 'package:promina/features/Home/cubit/gallery_cubit.dart';
import '../../../app/injuctoin_container.dart';
import '../domain/usecases/login_usecase.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit({required this.loginUseCase}) : super(LoginInitial());
  final LoginUseCase loginUseCase;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  LoginModel? loginModel;
  void userLogin({required String email, required String password}) async {
    emit(LoginLoadingState());
    final failureOrSuccess =
        await loginUseCase.call(email: email, password: password);
    failureOrSuccess
        .fold((failure) => emit(LoginErrorState(error: failure.getMessage())),
            (success) {
          sl<GalleryCubit>().getMyGallery();
          loginModel = success;
      emit(LoginSuccessState(model: success));
    });
  }
}
