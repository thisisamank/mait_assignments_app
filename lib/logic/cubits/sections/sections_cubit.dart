import 'package:bloc/bloc.dart';
import 'package:mait_assignments_app/data/model/sections.dart';
import 'package:mait_assignments_app/data/provider/firebase_provider.dart';
import 'package:meta/meta.dart';

part 'sections_state.dart';

class SectionsCubit extends Cubit<SectionsState> {
  SectionsCubit() : super(SectionsInitial());
  FirebaseProvider _provider = FirebaseProvider();

  getSection() async {
    try {
      emit(StudentSectionLoading());
      List<Section> sections = await _provider.getSections();
      emit(StudentSectionsLoaded(section: sections));
    } catch (_) {
      emit(StudentSectionFailure());
    }
  }
}
