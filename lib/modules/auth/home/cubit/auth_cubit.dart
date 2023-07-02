import 'package:barber/core/common/constants/app_routes.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthLogin());

  TextEditingController loginEmail = TextEditingController();
  TextEditingController loginPassword = TextEditingController();

  TextEditingController signupName = TextEditingController();
  TextEditingController signupEmail = TextEditingController();
  TextEditingController signupPassword = TextEditingController();

  void init() async {}

  void login() async {
    Modular.to.pushNamedAndRemoveUntil(AppRoutes.homeUser, (_) => false);
    emit(AuthLogin());
  }

  void signup() async {
    // emit(AuthLoading());
    // await Future.delayed(Duration(seconds: 2));
    Modular.to.pushNamedAndRemoveUntil(AppRoutes.homeUser, (_) => false);
    emit(AuthSignup());
  }
}
