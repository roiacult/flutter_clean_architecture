import 'dart:async';

import 'package:chopper/chopper.dart';
import 'package:clean_arch2/core/data/local/auth_local.dart';

// ignore: must_be_immutable
class HeaderInterceptor implements RequestInterceptor {
  static const String AUTH_HEADER = "Authorization";
  static const String BEARER = "token ";

  AuthLocal _authLocal;

  HeaderInterceptor(this._authLocal);

  @override
  FutureOr<Request> onRequest(Request request) async {
    final token = await _authLocal.getToken();

    if (token.isEmpty) return request;
    return request.copyWith(headers: {AUTH_HEADER: BEARER + token});
  }
}
