import 'package:clean_arch2/core/domain/usecase/login_usacase.dart';

abstract class AuthRepo {
  Stream<bool> getAuthState();

  Future<void> login(LoginParam param);
}
