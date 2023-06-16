part of 'auth_cubit.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthLogin extends AuthState {}

class AuthSignup extends AuthState {}
