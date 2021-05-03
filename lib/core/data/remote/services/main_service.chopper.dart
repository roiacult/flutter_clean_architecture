// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations
class _$MainService extends MainService {
  _$MainService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = MainService;

  @override
  Future<Response<dynamic>> productPage(int page) {
    final $url = '/api/products/';
    final $params = <String, dynamic>{'page': page};
    final $request = Request('GET', $url, client.baseUrl, parameters: $params);
    return client.send<dynamic, dynamic>($request);
  }
}
