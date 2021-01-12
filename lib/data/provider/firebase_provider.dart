import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mait_assignments_app/data/model/sections.dart';

class FirebaseProvider {
  FirebaseFirestore _firestoreInstance;

  Query _query;

  FirebaseProvider({FirebaseFirestore firestore})
      : this._firestoreInstance = firestore ?? FirebaseFirestore.instance;

  getSections() async {
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
}
