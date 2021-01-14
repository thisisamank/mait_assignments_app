import 'package:bloc/bloc.dart';
import 'package:mait_assignments_app/data/model/sections.dart';
import 'package:meta/meta.dart';

part 'sections_state.dart';

class SectionsCubit extends Cubit<SectionsState> {
  SectionsCubit() : super(SectionsInitial());
}
