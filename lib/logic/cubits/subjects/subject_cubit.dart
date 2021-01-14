import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mait_assignments_app/data/model/subjects.dart';
import 'package:mait_assignments_app/data/provider/firebase_provider.dart';

part 'subject_state.dart';

class SubjectCubit extends Cubit<SubjectState> {
  FirebaseProvider _provider = FirebaseProvider();

  SubjectCubit() : super(SubjectInitial());

  void getSubjects({String sectionName}) async {
    emit(SubjectLoading());

    try {
      final subjects = await _provider.getSubjects(sectionName: sectionName);
      emit(SubjectSuccess(subjects: subjects));
    } catch (_) {
      emit(SubjectFailure());
    }
  }
}
