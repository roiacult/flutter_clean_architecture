import 'package:clean_arch2/core/domain/domain.dart';
import 'package:clean_arch2/core/presentation/auth/bloc/auth_bloc.dart';
import 'package:koin/koin.dart';

final presentationModule = Module()
  ..factory((scope) => AuthBloc(scope.get<LoginUseCase>()));
