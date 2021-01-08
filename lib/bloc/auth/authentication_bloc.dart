import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:mait_assignments_app/data/models/user_repository.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final UserRepository _userRepository;
  AuthenticationBloc({@required UserRepository userRepository})
      : assert(userRepository != null),
        _userRepository = userRepository,
        super(UninitializedAuthState());
  @override
  AuthenticationState get initialState => UninitializedAuthState();
  @override
  Stream<AuthenticationState> mapEventToState(
    AuthenticationEvent event,
  ) async* {
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
      final isSignIn = await _userRepository.isSignedIn();
      if (isSignIn) {
        final name = await _userRepository.getUser();
        yield UserAuthSuccessState(username: name);
      } else {
        yield UserAuthFailState();
      }
    } catch (_) {
      yield UserAuthFailState();
    }
  }

  Stream<AuthenticationState> _mapLoggedInToState() async* {
    yield UserAuthSuccessState(username: await _userRepository.getUser());
  }

  Stream<AuthenticationState> _mapLoggedOutToState() async* {
    yield UserAuthFailState();
    _userRepository.signOut();
  }
}
