import 'package:clean_arch2/core/domain/domain.dart';
import 'package:clean_arch2/core/domain/repo/auth_repo.dart';
import 'package:clean_arch2/core/domain/usecase/authstate_usecase.dart';
import 'package:clean_arch2/core/domain/usecase/product_page_usecase.dart';
import 'package:koin/koin.dart';

final domainModule = Module()
  ..single((scope) => AuthStateUseCase(scope.get<AuthRepo>()))
  ..single((scope) => LoginUseCase(scope.get<AuthRepo>()))
  ..single((scope) => ProductPageUseCase(scope.get()));
