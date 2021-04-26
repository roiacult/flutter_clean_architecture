// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations
class _$AuthService extends AuthService {
  _$AuthService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = AuthService;

  @override
  Future<Response<dynamic>> loginRequest(RemoteLogin remoteLogin) {
    final $url = '/api/rest-auth/login/';
    final $body = remoteLogin;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<dynamic, dynamic>($request);
  }
}
