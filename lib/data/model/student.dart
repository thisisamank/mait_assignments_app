import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:mait_assignments_app/data/model/assignments.dart';

class Student {
  List<Assignment> _assignments = List<Assignment>();
  String section;
  String email;
  String name;
  String roll;
  int year;
  String branch;
  String uid;
  Student(
      {this.section,
      this.email,
      this.name,
      this.roll,
      this.year,
      this.branch,
      this.uid});

  factory Student.fromMap(Map<String, dynamic> studentMap) {
    final emailId = studentMap['email'];
    final name = studentMap['name'];
    final roll = studentMap['roll'];
    //final year = studentMap['year'];
    final section = studentMap['section'];
    final branch = studentMap['branch'];

    return Student(
      email: emailId,
      name: name,
      roll: roll,
      year: 1,
      section: section,
      branch: branch,
    );
  }

  // set setBranch(String branch) => this.branch = branch;
  // set setEmail(String branch) => this.branch = branch;
  // set setName(String branch) => this.branch = branch;
  // set setYear(String branch) => this.branch = branch;
  // set setRoll(String branch) => this.branch = branch;

  void addAssignments(Assignment assignment) {
    this._assignments.add(assignment);
  }
}
