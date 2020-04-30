import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_login/src/bloc/authentication_bloc.dart';
import 'package:flutter_login/src/bloc/authentication_event.dart';
import 'package:flutter_login/src/bloc/login_events.dart';
import 'package:flutter_login/src/bloc/login_state.dart';
import 'package:flutter_login/src/repository/user_repo.dart';
import 'package:meta/meta.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final UserRepository userRepository;
  final AuthenticationBloc authenticationBloc;

  LoginBloc({@required this.userRepository, @required this.authenticationBloc})
      : assert(userRepository != null),
        assert(authenticationBloc != null);

  @override
  LoginState get initialState => LoginInitial();

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is LoginButtonPressed) {
      yield LoginLoading();

      try {
        final token = await userRepository.authenticate(
            username: event.username, password: event.password);

        authenticationBloc.add(LogIn(token: token));
        yield LoginInitial();
      } catch (error) {
        yield LoginFailure(error: error.toString());
      }
    }
  }
}
