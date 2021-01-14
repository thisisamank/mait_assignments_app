part of 'register_students_cubit.dart';

@immutable
abstract class RegisterStudentsState extends Equatable {}

class RegisterStudentsInitial extends RegisterStudentsState {
  @override
  List<Object> get props {}
}

class RegisterStudentLoading extends RegisterStudentsState {
  @override
  List<Object> get props {}
}

class RegisterStudentSuccess extends RegisterStudentsState {
  @override
  List<Object> get props {}
}

class RegisterStudentFailure extends RegisterStudentsState {
  @override
  List<Object> get props {}
}
