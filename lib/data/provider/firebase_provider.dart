import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:mait_assignments_app/data/model/sections.dart';
import 'package:mait_assignments_app/data/model/subjects.dart';
import 'package:mait_assignments_app/data/provider/user_provider.dart';

class FirebaseProvider {
  FirebaseFirestore _firestoreInstance;
  UserProvider _userProvider;
  Query _query;

  FirebaseProvider({FirebaseFirestore firestore})
      : this._firestoreInstance = firestore ?? FirebaseFirestore.instance,
        _userProvider = UserProvider();

  Future<List<Section>> getSections() async {
    List<Section> list = List<Section>();
    _query = _firestoreInstance.collection('class');
    final responseDoc = await _query.get();
    int index = 0;
    for (final response in responseDoc.docs) {
      final respId = responseDoc.docs[index].id;
      list.add(Section.fromJson(response.data(), respId));
      index++;
    }
    return list;
  }

  void registerStudent(Map<String, dynamic> student) async {
    final user = await _userProvider.getUser();
    final studentId = user.uid;
    final name = user.displayName;
    print('name is $name');
    student['name'] = name;
    student['year'] = 1;
    student['name'] = name;

    await _firestoreInstance
        .collection('students')
        .doc(studentId)
        .collection('assignment')
        .doc()
        .set({});
    await _firestoreInstance.collection('students').doc(studentId).set(student);
  }

  getSubjects({@required final String sectionName}) async {
    final respDoc = await _firestoreInstance
        .collection('classes')
        .doc(sectionName)
        .collection('subjects')
        .get();
    List<Subject> _subjects = List<Subject>();
    for (final doc in respDoc.docs) {
      Subject subject = Subject(name: doc['sub'], id: doc.id);
    }
  }
}
