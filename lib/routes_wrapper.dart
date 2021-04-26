import 'package:clean_arch2/core/domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:koin_flutter/koin_flutter.dart';

class RoutesAuthWrapper extends StatelessWidget {
  final Widget _child;

  RoutesAuthWrapper(this._child);

  @override
  Widget build(BuildContext context) {
    // listen to auth state
    final authStream = get<AuthStateUseCase>().buildStream();
    authStream.listen((event) {
      if (event) {
        print("user is logged in going to /");
        Navigator.of(context)
            .pushNamedAndRemoveUntil('/', (Route<dynamic> route) => false);
      } else {
        print("user is logged out going to /login");
        Navigator.of(context)
            .pushNamedAndRemoveUntil('/login', (Route<dynamic> route) => false);
      }
    });
    return _child;
  }
}
