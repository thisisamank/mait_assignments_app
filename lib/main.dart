import 'package:flutter/material.dart';
import 'package:mait_assignments_app/screens/student_login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mait Assignments',
      home: StudentLogin(),
    );
  }
}
