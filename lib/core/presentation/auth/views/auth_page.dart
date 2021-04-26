import 'package:clean_arch2/core/presentation/auth/bloc/auth_bloc.dart';
import 'package:clean_arch2/core/presentation/auth/views/auth_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:koin_flutter/koin_flutter.dart';

class AuthPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = get<AuthBloc>();

    return BlocProvider(
      create: (context) => bloc,
      child: AuthView(),
    );
  }
}
