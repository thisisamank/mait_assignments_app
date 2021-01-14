import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'register_students_state.dart';

class RegisterStudentsCubit extends Cubit<RegisterStudentsState> {
  RegisterStudentsCubit() : super(RegisterStudentsInitial());
}
