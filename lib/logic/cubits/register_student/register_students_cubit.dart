import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mait_assignments_app/data/provider/firebase_provider.dart';
import 'package:meta/meta.dart';

part 'register_students_state.dart';

class RegisterStudentsCubit extends Cubit<RegisterStudentsState> {
  RegisterStudentsCubit() : super(RegisterStudentsInitial());
  FirebaseProvider _provider = FirebaseProvider();

  void registerStudent(Map<String,dynamic> student) {
    emit(RegisterStudentLoading());
    try{
       _provider.registerStudent(student);
       emit(RegisterStudentSuccess());
    }
    catch(_){
      emit(RegisterStudentFailure());
    }
  }
}
