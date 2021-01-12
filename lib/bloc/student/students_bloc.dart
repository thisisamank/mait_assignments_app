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
      _mapStudentSucessInitial();
    }
  }

  _mapStudentSucessInitial() async*{
    yield StudentSectionLoading();

    List<Section> sections =_repository.getSections();
    yield StudentSectionsLoaded(section: sections);
  }
}
