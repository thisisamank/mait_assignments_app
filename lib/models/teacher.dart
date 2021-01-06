import 'package:lipsum/lipsum.dart' as lipsum;

class Teacher {
  Teacher({this.id, this.name, this.subjectId});
  final id;
  String name;
  List<int> subjectId;
  static final teacherData = [
    Teacher(
      id: 1,
      subjectId: [1, 3],
      name: lipsum.createWord(numWords: 6),
    ),
    Teacher(
      id: 2,
      subjectId: [2],
      name: lipsum.createWord(numWords: 6),
    ),
    Teacher(
      id: 3,
      subjectId: [4],
      name: lipsum.createWord(numWords: 6),
    ),
    Teacher(
      id: 4,
      subjectId: [5],
      name: lipsum.createWord(numWords: 6),
    ),
  ];
}
