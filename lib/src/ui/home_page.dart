import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_login/src/bloc/authentication_bloc.dart';
import 'package:flutter_login/src/bloc/authentication_event.dart';

class HomePage extends StatelessWidget {
  final String title = 'home';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Container(
        child: Center(
          child: RaisedButton(
            child: Text('logout'),
            onPressed: () {
              BlocProvider.of<AuthenticationBloc>(context).add(LogOut());
            },
          ),
        ),
      ),
    );
  }
}
