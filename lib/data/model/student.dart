import 'package:mait_assignments_app/data/model/assignments.dart';

class Student {
  List<Assignment> _assignments;
  final String branch;
  final String email;
  final String name;
  final String roll;
  final int year;

  Student({this.branch, this.email, this.name, this.roll, this.year})
      : _assignments = List<Assignment>();

  void addAssignments(Assignment assignment) {
    this._assignments.add(assignment);
  }
}
