part of 'auth_bloc.dart';

abstract class AuthEvent {
  const AuthEvent();
}

class LoginEvent extends AuthEvent {
  String email;
  String password;

  LoginEvent({required this.email, required this.password});
}

class LogoutEvent extends AuthEvent {}
