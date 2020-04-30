import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../repository/user_repo.dart';
import 'authentication_event.dart';
import 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final UserRepository userRepo;

  AuthenticationBloc({@required this.userRepo});

  @override
  AuthenticationState get initialState => AuthenticationUninitialized();

  @override
  Stream<AuthenticationState> mapEventToState(
      AuthenticationEvent event) async* {
    if (event is StartApp) {
      final bool hasToken = await userRepo.hasToken();

      if (hasToken)
        yield AuthenticationAuthenticated();
      else
        yield AuthenticationUnAuthenticated();
    }

    if (event is LogIn) {
      yield AuthenticationLoading();
      await userRepo.persistToken(event.token);
      yield AuthenticationAuthenticated();
    }
    if (event is LogOut) {
      yield AuthenticationLoading();
      await userRepo.deleteToken();
      yield AuthenticationUnAuthenticated();
    }
  }
}
