part of 'authentication_bloc.dart';

abstract class AuthenticationState extends Equatable {
  const AuthenticationState();

  @override
  List<Object> get props => [];
}

class AuthenticationFailure extends AuthenticationState {}

class AuthenticationInitial extends AuthenticationState {}

class AuthenticationSuccess extends AuthenticationState {
  AuthenticationSuccess({@required this.user});
  final UserModel user;
  @override
  List<Object> get props => [user];
}
