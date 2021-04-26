import 'package:chopper/chopper.dart';
import 'package:clean_arch2/core/data/remote/models/remote_login.dart';
import 'package:clean_arch2/core/data/remote/models/remote_token.dart';
import 'package:clean_arch2/core/data/remote/services/auth_service.dart';

class AuthRemote {
  ChopperClient _client;

  AuthRemote(this._client);

  Future<RemoteToken> login(String email, String password) async {
    final authService = _client.getService<AuthService>();
    final response =
        await authService.loginRequest(RemoteLogin(email, password));

    if (response.statusCode >= 200 && response.statusCode < 300) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      final body = response.body;
      if (body != null)
        return RemoteToken.fromJson(body);
      else
        throw Exception('Failed to login');
    } else {
      // in real world app we should raise a specific type Exception
      throw Exception('Failed to login');
    }
  }
}
