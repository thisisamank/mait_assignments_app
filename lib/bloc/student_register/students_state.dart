part of 'students_bloc.dart';

abstract class StudentsState extends Equatable {
  const StudentsState();
}

class StudentsInitial extends StudentsState {
  @override
  List<Object> get props => [];
}

class StudentSectionLoading extends StudentsInitial {
  @override
  List<Object> get props => [];
}

class StudentSectionsLoaded extends StudentsInitial {
  final List<Section> section;

  StudentSectionsLoaded({this.section});

  @override
  List<Object> get props => [section];
}

class StudentSectionFailure extends StudentsInitial {
  @override
  List<Object> get props {}
}

class StudentRegisterSucess extends StudentsInitial {
  @override
  List<Object> get props {}
}

class StudentRegisterLoading extends StudentsInitial {
  @override
  List<Object> get props {}
}

class StudentRegisterFailure extends StudentsInitial {
  @override
  List<Object> get props {}
}
