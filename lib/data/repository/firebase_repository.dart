import 'package:mait_assignments_app/data/model/sections.dart';
import 'package:mait_assignments_app/data/provider/firebase_provider.dart';

class FirebaseRepository {
  FirebaseProvider _provider;

  FirebaseRepository({FirebaseProvider provider})
      : this._provider = provider ?? FirebaseProvider();

  List<Section> getSections(){
    return _provider.getSections();
  }
}
