import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:mait_assignments_app/data/model/user.dart';
import 'package:mait_assignments_app/data/provider/user_provider.dart';

part 'authentication_event.dart';

part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc() : super(AuthenticationInitial());
  final UserProvider _userProvider = UserProvider();

  @override
  Stream<AuthenticationState> mapEventToState(
      AuthenticationEvent event) async* {
    if (event is AuthenticationStarted) {
      yield* _mapStartedToState();
    } else if (event is AuthenticationLoggedIn) {
      yield* _mapLoggedInToState();
    } else if (event is AuthenticationLoggedOut) {
      yield* _mapLoggedOutToState();
    }
  }

  Stream<AuthenticationState> _mapStartedToState() async* {
    try {
      final isSignedIn = await _userProvider.isSignedIn();
      if (isSignedIn) {
        final name = _userProvider.getUserModel();
        yield AuthenticationSuccess(user: name);
      } else {
        yield AuthenticationFailure();
      }
    } catch (_) {
      yield AuthenticationFailure();
    }
  }

  Stream<AuthenticationState> _mapLoggedInToState() async* {
    yield AuthenticationSuccess(user: _userProvider.getUserModel());
  }

  Stream<AuthenticationState> _mapLoggedOutToState() async* {
    yield AuthenticationFailure();
    _userProvider.signOut();
  }
}
