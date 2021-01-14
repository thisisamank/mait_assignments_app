import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mait_assignments_app/data/model/sections.dart';
import 'package:mait_assignments_app/data/repository/firebase_repository.dart';

part 'students_event.dart';

part 'students_state.dart';

class StudentsBloc extends Bloc<StudentsEvent, StudentsState> {
  StudentsBloc() : super(StudentsInitial());

  FirebaseRepository _repository = FirebaseRepository();

  @override
  Stream<StudentsState> mapEventToState(StudentsEvent event) async* {

    if (event is StudentSectionInitial) {
      try {
        yield StudentSectionLoading();
        List<Section> sections = await _repository.getSections();
        yield StudentSectionsLoaded(section: sections);
      } catch (_) {
        yield StudentSectionFailure();
      }
    } else if (event is StudentRegisterInitial) {
      try {
        yield StudentRegisterLoading();
        Map<String, dynamic> student = event.student;
        _repository.registerStudents(student);
        yield StudentRegisterSucess();
      } catch (_) {
        yield StudentRegisterFailure();
      }
    }
  }
}
