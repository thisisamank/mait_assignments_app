import 'package:flutter/cupertino.dart';

class Section {
  final String id;
  final int year;
  final String secName;

  Section({this.year, this.id, this.secName});

  factory Section.fromJson(@required Map<String, dynamic> json, @required id) {
    return Section(id: id, secName: json['section'], year: json['year']);
  }
}
