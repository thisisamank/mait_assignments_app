part of 'authentication_bloc.dart';

abstract class AuthenticationState extends Equatable {
  const AuthenticationState();

  @override
  List<Object> get props => [];
}

class UnAuthenticatedAuthState extends AuthenticationState {}

class UnInitialziedAuthState extends AuthenticationState {}

class AuthenticatedAuthState extends AuthenticationState {
  AuthenticatedAuthState({@required this.user});
  final user;
  @override
  List<Object> get props => [user];
}
