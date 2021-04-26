import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:clean_arch2/core/domain/usecase/login_usacase.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  LoginUseCase _loginUseCase;

  AuthBloc(this._loginUseCase) : super(AuthInitial());

  @override
  Stream<AuthState> mapEventToState(
    AuthEvent event,
  ) async* {
    if (event is LoginEvent) {
      yield* _mapLoginEventToState(event);
    }
  }

  Stream<AuthState> _mapLoginEventToState(LoginEvent event) async* {
    yield AuthLoading();
    try {
      await _loginUseCase
          .build(LoginParam(email: event.email, password: event.password));
      yield LogedIn();
    } on Exception catch (e) {
      yield AuthFailure();
    }
  }
}
