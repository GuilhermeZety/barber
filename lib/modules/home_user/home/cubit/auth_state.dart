part of 'auth_cubit.dart';

abstract class HomeUserState extends Equatable {
  const HomeUserState();

  @override
  List<Object> get props => [];
}

class HomeUserLogin extends HomeUserState {}

class HomeUserSignup extends HomeUserState {}
