part of 'auth_bloc.dart';

abstract class AuthState {
  const AuthState();
}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthFailure extends AuthState {
  Exception failure;

  AuthFailure(this.failure);
}

class LogedIn extends AuthState {}

class LogedOut extends AuthState {}
