part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class LoginWithCredentials extends LoginEvent {
  final String email;
  final String password;
  LoginWithCredentials({@required this.email, @required this.password});
  @override
  List<Object> get props => [email, password];
}

class LoginWithGoogle extends LoginEvent {
  @override
  List<Object> get props => [];
}
