import 'package:chopper/chopper.dart';
import 'package:clean_arch2/core/data/remote/models/remote_login.dart';

// This is necessary for the generator to work.
part "auth_service.chopper.dart";

@ChopperApi(baseUrl: "/api/rest-auth")
abstract class AuthService extends ChopperService {
  @Post(path: "/login/")
  Future<Response> loginRequest(@Body() RemoteLogin remoteLogin);

  // A helper method that helps instantiating the service. You can omit this method and use the generated class directly instead.
  static AuthService create() => _$AuthService();
}
