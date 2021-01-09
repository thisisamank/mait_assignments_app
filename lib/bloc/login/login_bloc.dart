import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:mait_assignments_app/repository/user_repository.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc(this._userRepository) : super(LoginEmptyState());

  UserRepository _userRepository;
  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is LoginWithGoogleEvent) {
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
      await _userRepository.signInWithGoogle();
      yield LoginSuccessState(name: (_userRepository.getUserName()));
    } catch (_) {
      yield LoginFailureState();
    }
  }

  Stream<LoginState> _mapLoginWithCredentialsPressedToState({
    String email,
    String password,
  }) async* {
    yield LoginLoadingState();
    try {
      await _userRepository.signInWithCredentials(email, password);
      yield LoginSuccessState(name: _userRepository.getUserName());
    } catch (_) {
      yield LoginFailureState();
    }
  }
}
