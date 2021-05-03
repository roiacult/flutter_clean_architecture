import 'package:chopper/chopper.dart';
import 'package:clean_arch2/core/data/auth_repo_impl.dart';
import 'package:clean_arch2/core/data/const.dart';
import 'package:clean_arch2/core/data/local/auth_local.dart';
import 'package:clean_arch2/core/data/main_repo_impl.dart';
import 'package:clean_arch2/core/data/remote/auth_remote.dart';
import 'package:clean_arch2/core/data/remote/main_remote.dart';
import 'package:clean_arch2/core/data/remote/services/auth_service.dart';
import 'package:clean_arch2/core/data/remote/services/main_service.dart';
import 'package:clean_arch2/core/data/remote/utils/header_interceptor.dart';
import 'package:clean_arch2/core/domain/repo/auth_repo.dart';
import 'package:clean_arch2/core/domain/repo/main_repo.dart';
import 'package:koin/internals.dart';
import 'package:koin/koin.dart';

ChopperClient Function(Scope scope) httpClientProvider =
    (scope) => ChopperClient(
        baseUrl: API_URL,
        services: [AuthService.create(), MainService.create()],
        converter: JsonConverter(),
        errorConverter: JsonConverter(),
        interceptors: [
          HeaderInterceptor(scope.get()),
          HttpLoggingInterceptor(),
          CurlInterceptor(),
        ]);

final dataModule = Module()
  ..single((scope) => AuthLocal())
  ..single(httpClientProvider)
  ..single((scope) => AuthRemote(scope.get()))
  ..single((scope) => MainRemote(scope.get()))
  ..single<AuthRepo>(
      (scope) => AuthRepoImplementation(scope.get(), scope.get()))
  ..single<MainRepo>((scope) => MainRepoImpl(scope.get()));
