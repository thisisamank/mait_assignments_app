part of 'students_bloc.dart';

abstract class StudentsEvent extends Equatable {
  const StudentsEvent();
}

class StudentSectionInitial extends StudentsEvent {
  @override
  List<Object> get props {}
}
