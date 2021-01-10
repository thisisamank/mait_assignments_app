part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginState {
  @override
  List<Object> get props => [];
}

class LoginLoading extends LoginState {
  @override
  List<Object> get props => [];
}

class LoginFailure extends LoginState {
  @override
  List<Object> get props => [];
}

class LoginSuccess extends LoginState {
  final UserModel user;
  LoginSuccess({this.user});
  @override
  List<Object> get props => [user];
}
