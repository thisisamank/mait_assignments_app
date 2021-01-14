part of 'authentication_bloc.dart';

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object> get props => [];
}

class AuthenticationStarted extends AuthenticationEvent {
  @override
  String toString() => 'AppStarted';

  @override
  List<Object> get props => [];
}

class AuthenticationLoggedIn extends AuthenticationEvent {
  @override
  String toString() => 'LoggedIn';

  @override
  List<Object> get props => [];
}

class AuthenticationLoggedOut extends AuthenticationEvent {
  @override
  String toString() => 'LoggedOut';

  @override
  List<Object> get props => [];
}
