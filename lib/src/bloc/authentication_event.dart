import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object> get props => [];
}

class StartApp extends AuthenticationEvent {}

class LogIn extends AuthenticationEvent {
  final String token;

  const LogIn({@required this.token});

  @override
  List<Object> get props => [token];

  @override
  String toString() {
    return 'LogedIn { token: $token}';
  }
}

class LogOut extends AuthenticationEvent {}
