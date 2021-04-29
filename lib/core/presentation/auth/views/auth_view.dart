import 'package:clean_arch2/core/domain/failures.dart';
import 'package:clean_arch2/core/presentation/auth/bloc/auth_bloc.dart';
import 'package:clean_arch2/core/presentation/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthView extends StatefulWidget {
  @override
  _AuthViewState createState() => _AuthViewState();
}

class _AuthViewState extends State<AuthView> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void _loginPressed(BuildContext context) {
    final email = emailController.text.toString();
    final password = passwordController.text.toString();
    BlocProvider.of<AuthBloc>(context)
        .add(LoginEvent(email: email, password: password));
  }

  void _failureHandler(BuildContext context, state) {
    handleFailures(
        context: context,
        failure: (state as AuthFailure).failure,
        handler: (Exception e){
          if(e is OtherFailure && e.type is WrongCredentials)
            return "Wrong creds!!";
          else return "Unknown failure";
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Login Page"),
      ),
      body: BlocConsumer<AuthBloc, AuthState>(
          listener: _failureHandler,
          listenWhen: (prev, current) {
            return (current is AuthFailure);
          },
          builder: (context, state) {
            return Stack(
              children: [
                SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 60.0),
                        child: Center(
                          child: Container(
                              width: 200,
                              height: 150,
                              child:
                                  Image.asset('asset/images/flutter-logo.png')),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        child: TextField(
                          controller: emailController,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Email',
                              hintText: 'abc@example.com'),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 15.0, right: 15.0, top: 15, bottom: 0),
                        child: TextField(
                          controller: passwordController,
                          obscureText: true,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Password',
                              hintText: 'enter your password please'),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          //TODO FORGOT PASSWORD SCREEN GOES HERE
                        },
                        child: Text(
                          'Forgot Password',
                          style: TextStyle(fontSize: 15),
                        ),
                      ),
                      Container(
                        height: 50,
                        width: 250,
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(20)),
                        child: ElevatedButton(
                          onPressed: () => _loginPressed(context),
                          child: Text(
                            'Login',
                            style: TextStyle(color: Colors.white, fontSize: 25),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 130,
                      ),
                      Text('New User? Create Account')
                    ],
                  ),
                ),
                if (state is AuthLoading)
                  Center(child: CircularProgressIndicator())
              ],
            );
          }),
    );
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
