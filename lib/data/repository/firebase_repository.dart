import 'package:mait_assignments_app/data/model/sections.dart';
import 'package:mait_assignments_app/data/model/student.dart';
import 'package:mait_assignments_app/data/provider/firebase_provider.dart';

class FirebaseRepository {
  FirebaseProvider _provider;

  FirebaseRepository({FirebaseProvider provider})
      : this._provider = provider ?? FirebaseProvider();

  Future<List<Section>> getSections() async {
    final data = await _provider.getSections();
    return data;
  }

  void registerStudents(Map<String, dynamic> student) {
    _provider.registerStudent(student);
  }
}
