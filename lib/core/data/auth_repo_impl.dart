import 'package:clean_arch2/core/data/local/auth_local.dart';
import 'package:clean_arch2/core/data/remote/auth_remote.dart';
import 'package:clean_arch2/core/domain/repo/auth_repo.dart';
import 'package:clean_arch2/core/domain/usecase/login_usacase.dart';

class AuthRepoImplementation implements AuthRepo {
  AuthLocal _authLocal;
  AuthRemote _authService;

  AuthRepoImplementation(this._authLocal, this._authService);

  @override
  Stream<bool> getAuthState() {
    return _authLocal.authStateStream();
  }

  @override
  Future<void> login(LoginParam param) async {
    final token = await _authService.login(param.email, param.password);
    await _authLocal.saveToken(token.key);
  }
}
