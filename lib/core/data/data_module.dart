import 'package:chopper/chopper.dart';
import 'package:clean_arch2/core/data/auth_repo_impl.dart';
import 'package:clean_arch2/core/data/const.dart';
import 'package:clean_arch2/core/data/local/auth_local.dart';
import 'package:clean_arch2/core/data/remote/auth_remote.dart';
import 'package:clean_arch2/core/data/remote/services/auth_service.dart';
import 'package:clean_arch2/core/domain/repo/auth_repo.dart';
import 'package:koin/internals.dart';
import 'package:koin/koin.dart';

AuthRepo Function(Scope scope) authRepoProvider = (scope) =>
    AuthRepoImplementation(scope.get<AuthLocal>(), scope.get<AuthRemote>());

ChopperClient Function(Scope scope) httpClientProvider = (scope) =>
    ChopperClient(
        baseUrl: API_URL,
        services: [AuthService.create()],
        converter: JsonConverter(),
        errorConverter: JsonConverter(),
        interceptors: [HttpLoggingInterceptor()]);

final dataModule = Module()
  ..single((scope) => AuthLocal())
  ..single(httpClientProvider)
  ..single((scope) => AuthRemote(scope.get<ChopperClient>()))
  ..single(authRepoProvider);
