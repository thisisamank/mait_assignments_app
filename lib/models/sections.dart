import 'package:mait_assignments_app/models/subject.dart';
import 'package:lipsum/lipsum.dart' as lipsum;
import 'package:mait_assignments_app/models/teacher.dart';

class Section {
  Section({this.name});
  String name;
  List<Subject> _subjects = [
    Subject(
      id: 1,
      name: lipsum.createWord(numWords: 4),
      teacherId: 1,
    ),
    Subject(
      id: 2,
      name: lipsum.createWord(numWords: 4),
      teacherId: 2,
    ),
    Subject(
      id: 3,
      name: lipsum.createWord(numWords: 4),
      teacherId: 3,
    ),
    Subject(
      id: 4,
      name: lipsum.createWord(numWords: 4),
      teacherId: 4,
    ),
    Subject(
      id: 5,
      name: lipsum.createWord(numWords: 4),
      teacherId: 5,
    ),
    Subject(
      id: 6,
      name: lipsum.createWord(numWords: 4),
      teacherId: 6,
    ),
  ];

  static final getSection = [
    Section(name: "H1"),
    Section(name: "H2"),
  ];
}
