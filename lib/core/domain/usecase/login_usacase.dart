import 'package:clean_arch2/core/core.dart';
import 'package:clean_arch2/core/domain/repo/auth_repo.dart';

class LoginUseCase extends ParamUseCase<LoginParam, void> {
  AuthRepo _authRepo;

  LoginUseCase(this._authRepo);

  @override
  Future<void> build(LoginParam param) {
    return _authRepo.login(param);
  }
}

class LoginParam {
  String email;
  String password;

  LoginParam({required this.email, required this.password});
}
