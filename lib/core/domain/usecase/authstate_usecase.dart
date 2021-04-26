import 'package:clean_arch2/core/core.dart';
import 'package:clean_arch2/core/domain/repo/auth_repo.dart';

class AuthStateUseCase extends StreamUseCase<bool> {
  AuthRepo _authRepo;

  AuthStateUseCase(this._authRepo);

  @override
  Stream<bool> buildStream() {
    return _authRepo.getAuthState();
  }
}
