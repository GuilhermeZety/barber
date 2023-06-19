import 'package:barber/core/common/constants/app_routes.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'auth_state.dart';

class HomeUserCubit extends Cubit<HomeUserState> {
  HomeUserCubit() : super(HomeUserLogin());

  void init() async {}

  void login() async {
    // emit(HomeUserLoading());
    // await Future.delayed(Duration(seconds: 2));

    Modular.to.pushNamedAndRemoveUntil(AppRoutes.home_user, (_) => false);
    emit(HomeUserLogin());
  }

  void signup() async {
    // emit(HomeUserLoading());
    // await Future.delayed(Duration(seconds: 2));
    Modular.to.pushNamedAndRemoveUntil(AppRoutes.home_user, (_) => false);
    emit(HomeUserSignup());
  }
}
