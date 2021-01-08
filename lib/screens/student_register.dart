// import 'package:flutter/material.dart';
// import 'package:mait_assignments_app/config/config.dart';
// import 'package:mait_assignments_app/models/sections.dart';
// import 'package:mait_assignments_app/widgets/global_widgets.dart';

// class StudentRegistration extends StatefulWidget {
//   @override
//   _StudentRegistrationState createState() => _StudentRegistrationState();
// }

// class _StudentRegistrationState extends State<StudentRegistration> {
//   @override
//   Widget build(BuildContext context) {
//     //List<Section> section = Section.getSection;
//     List<String> subjects = [
//       section[0].name,
//       section[1].name,
//     ];
//     int _value = 1;
//     return Scaffold(
//       appBar: AppWidgets.getAppBar(),
//       body: Container(
//         child: Column(children: [
//           TextField(),
//           Container(
//             padding: EdgeInsets.all(20.0),
//             child: DropdownButton(
//                 value: _value,
//                 items: [
//                   DropdownMenuItem(
//                     child: Text("First Item"),
//                     value: 1,
//                   ),
//                   DropdownMenuItem(
//                     child: Text("Second Item"),
//                     value: 2,
//                   ),
//                   DropdownMenuItem(child: Text("Third Item"), value: 3),
//                   DropdownMenuItem(child: Text("Fourth Item"), value: 4)
//                 ],
//                 onChanged: (value) {
//                   setState(() {
//                     _value = value;
//                   });
//                 }),
//           ),
//         ]),
//       ),
//     );
//   }
// }
