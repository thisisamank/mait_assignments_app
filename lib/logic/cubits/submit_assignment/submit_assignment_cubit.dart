import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'submit_assignment_state.dart';

class SubmitAssignmentCubit extends Cubit<SubmitAssignmentState> {
  SubmitAssignmentCubit() : super(SubmitAssignmentInitial());
}
