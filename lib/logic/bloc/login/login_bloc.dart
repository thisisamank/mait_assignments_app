import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mait_assignments_app/data/model/user.dart';
import 'package:mait_assignments_app/data/provider/user_provider.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial());

  UserProvider _userProvider = UserProvider();

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is LoginWithGoogle) {
      yield* _mapLoginWithGooglePressedToState();
    } else if (event is LoginWithCredentials) {
      yield* _mapLoginWithCredentialsPressedToState(
        email: event.email,
        password: event.password,
      );
    }
  }

  Stream<LoginState> _mapLoginWithGooglePressedToState() async* {
    try {
      await _userProvider.signInWithGoogle();
      yield LoginSuccess(user: _userProvider.getUserModel());
    } catch (_) {
      yield LoginFailure();
    }
  }

  Stream<LoginState> _mapLoginWithCredentialsPressedToState({
    String email,
    String password,
  }) async* {
    yield LoginLoading();
    try {
      await _userProvider.signInWithCredentials(email, password);
      yield LoginSuccess(user: _userProvider.getUserModel());
    } catch (_) {
      yield LoginFailure();
    }
  }
}
