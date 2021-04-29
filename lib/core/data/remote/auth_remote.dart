import 'package:chopper/chopper.dart';
import 'package:clean_arch2/core/data/remote/models/remote_login.dart';
import 'package:clean_arch2/core/data/remote/models/remote_token.dart';
import 'package:clean_arch2/core/data/remote/services/auth_service.dart';
import 'package:clean_arch2/core/data/utils.dart';
import 'package:clean_arch2/core/domain/failures.dart';

class AuthRemote {
  ChopperClient _client;

  AuthRemote(this._client);

  Future<RemoteToken> login(String email, String password) async {
    final authService = _client.getService<AuthService>();

    // send request and check connectivity
    final response = await sendRequest(
        authService.loginRequest(RemoteLogin(email, password)));

    final body = handleFailures(
        response: response,
        emptyResponse: false,
        additionalCheck: (Response response) {
          if (response.error
              .toString()
              .contains("Unable to log in with provided credentials"))
            throw OtherFailure(WrongCredentials());
          throw throw UnknownFailure();
        })!;
    return RemoteToken.fromJson(body);
  }
}
