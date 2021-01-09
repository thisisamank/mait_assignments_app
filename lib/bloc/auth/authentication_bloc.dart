import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:mait_assignments_app/repository/user_repository.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc(this._userRepository) : super(UnInitialziedAuthState());
  final UserRepository _userRepository;

  @override
  Stream<AuthenticationState> mapEventToState(
      AuthenticationEvent event) async* {
    if (event is AppStarted) {
      yield* _mapAppStartedToState();
    } else if (event is LoggedIn) {
      yield* _mapLoggedInToState();
    } else if (event is LoggedOut) {
      yield* _mapLoggedOutToState();
    }
  }

  Stream<AuthenticationState> _mapAppStartedToState() async* {
    try {
      final isSignedIn = await _userRepository.isSignedIn();
      if (isSignedIn) {
        final name = await _userRepository.getUser();
        yield AuthenticatedAuthState(user: name);
      } else {
        yield UnAuthenticatedAuthState();
      }
    } catch (_) {
      yield UnAuthenticatedAuthState();
    }
  }

  Stream<AuthenticationState> _mapLoggedInToState() async* {
    yield AuthenticatedAuthState(user: await _userRepository.getUser());
  }

  Stream<AuthenticationState> _mapLoggedOutToState() async* {
    yield UnAuthenticatedAuthState();
    _userRepository.signOut();
  }
}
