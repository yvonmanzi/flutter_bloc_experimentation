import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_login/src/bloc/authentication.dart';
import 'package:flutter_login/src/repository/user_repo.dart';
import 'package:flutter_login/src/ui/login_page.dart';
import 'package:flutter_login/src/ui/splash.dart';

import 'home_page.dart';

class MyApp extends StatelessWidget {
  final UserRepository _userRepository;

  MyApp(this._userRepository);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
          builder: (context, state) {
        if (state is AuthenticationUninitialized) return SplashPage();
        if (state is AuthenticationAuthenticated) return HomePage();
        if (state is AuthenticationUnAuthenticated)
          return LoginPage(userRepository: _userRepository);
        if (state is AuthenticationLoading)
          return CircularProgressIndicator();
        else
          return Text('Nous sommes fucked!');
      }),
    );
  }
}
