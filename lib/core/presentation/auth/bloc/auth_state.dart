part of 'auth_bloc.dart';

abstract class AuthState {
  const AuthState();
}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthFailure extends AuthState {}

class LogedIn extends AuthState {}

class LogedOut extends AuthState {}
