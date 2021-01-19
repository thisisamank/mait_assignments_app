import 'package:cloud_firestore/cloud_firestore.dart';

class CreateAssignment {
  final Timestamp deadline;
  final Timestamp initialTime;
  final String title;
  final String id;
  final String url;

  CreateAssignment(
      {this.deadline, this.initialTime, this.title, this.id, this.url});
}
