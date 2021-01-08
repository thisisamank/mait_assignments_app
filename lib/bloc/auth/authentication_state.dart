part of 'authentication_bloc.dart';

abstract class AuthenticationState extends Equatable {
  const AuthenticationState();

  @override
  List<Object> get props => [];
}

class UninitializedAuthState extends AuthenticationState {
  @override
  String toString() {
    return 'UninitializedAuthState';
  }
}

class UserAuthSuccessState extends AuthenticationState {
  @override
  String toString() {
    return 'UserAuthSuccessState';
  }

  final String username;
  UserAuthSuccessState({this.username});
}

class UserAuthFailState extends AuthenticationState {
  @override
  String toString() {
    return 'UserAuthFailState';
  }
}
