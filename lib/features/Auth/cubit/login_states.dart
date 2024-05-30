import 'package:flutter/cupertino.dart';

import '../data/models/LoginModel.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoadingState extends LoginState {}
class LoginErrorState extends LoginState {
  final String error;

  LoginErrorState({required this.error});
}
class LoginSuccessState extends LoginState {
  final LoginModel model;

  LoginSuccessState({required this.model});
}
