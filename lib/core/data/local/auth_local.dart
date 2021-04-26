import 'package:clean_arch2/core/data/const.dart';
import 'package:streaming_shared_preferences/streaming_shared_preferences.dart';

class AuthLocal {
  AuthLocal();

  Stream<bool> authStateStream() async* {
    final _preferences = await StreamingSharedPreferences.instance;
    yield* _preferences
        .getString(TOKEN_KEY, defaultValue: "")
        .map((event) => event.isNotEmpty);
  }

  Future<bool> saveToken(String token) async {
    final _preferences = await StreamingSharedPreferences.instance;
    return await _preferences.setString(TOKEN_KEY, token);
  }

  Future<String> getToken() async {
    final _preferences = await StreamingSharedPreferences.instance;
    return _preferences.getString(TOKEN_KEY, defaultValue: "").key;
  }
}
