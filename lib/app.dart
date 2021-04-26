import 'package:clean_arch2/core/domain/domain.dart';
import 'package:clean_arch2/core/presentation/auth/views/auth_page.dart';
import 'package:clean_arch2/core/presentation/home/views/home_page.dart';
import 'package:clean_arch2/navigation/routes.dart';
import 'package:clean_arch2/utils/themes.dart';
import 'package:flutter/material.dart';
import 'package:koin_flutter/koin_flutter.dart';

class CleanArchApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: handle theme changes here
    final authStream = get<AuthStateUseCase>().buildStream();
    return MaterialApp(
      theme: lightTheme,
      routes: routes,
      home: StreamBuilder<bool>(
        stream: authStream,
        initialData: false,
        builder: (context, snapshot) {
          if (snapshot.data == true)
            return HomePage();
          else
            return AuthPage();
        },
      ),
    );
  }
}
