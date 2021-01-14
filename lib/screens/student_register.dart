import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mait_assignments_app/bloc/student_register/students_bloc.dart';
import 'package:mait_assignments_app/config/config.dart';
import 'package:mait_assignments_app/data/model/sections.dart';
import 'package:mait_assignments_app/data/model/student.dart';
import 'package:mait_assignments_app/widgets/global_widgets.dart';
import 'package:toast/toast.dart';

class StudentRegistration extends StatefulWidget {
  @override
  _StudentRegistrationState createState() => _StudentRegistrationState();
}

class _StudentRegistrationState extends State<StudentRegistration> {
  Map<String, dynamic> _studentMap = {};
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _rollControlller = TextEditingController();
  //final TextEditingController _branch = TextEditingController();

  @override
  void initState() {
    BlocProvider.of<StudentsBloc>(context).add(StudentSectionInitial());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppWidgets.getAppBar(),
      body: Container(
        margin: EdgeInsets.all(width / 8),
        width: width / 1.4,
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _emailField(),
              _rollNoField(),
              _sectionDialogBox(),
              MaterialButton(
                onPressed: () {
                  final emailId = _emailController.text;
                  final rollNo = _rollControlller.text;
                  _studentMap['email'] = emailId;
                  _studentMap['roll'] = rollNo;
                  BlocProvider.of<StudentsBloc>(context)
                      .add(StudentRegisterInitial(_studentMap));
                },
                child: Text("Register"),
              )
            ],
          ),
        ),
      ),
    );
  }

  Container _sectionDialogBox() {
    return Container(
      padding: EdgeInsets.all(20.0),
      child: BlocBuilder<StudentsBloc, StudentsState>(
        builder: (context, state) {
          if (state is StudentSectionLoading) {
            return CircularProgressIndicator();
          } else if (state is StudentSectionsLoaded) {
            return MaterialButton(
              color: AppColors.kPrimaryColor,
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Select your Section'),
                        content: setUpAlertDialogbox(state.section),
                      );
                    });
              },
              child: Text(
                "Select your Section",
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 16,
                  color: AppColors.kOnPrimaryTextColor,
                ),
              ),
            );
          } else {
            return Text(
              "Section Loading Failure... please restart app!",
            );
          }
        },
      ),
    );
  }

  TextFormField _emailField() {
    return TextFormField(
      controller: _emailController,
      validator: (value) {
        if ((value.contains("@aspc.mait.ac.in") ||
            value.contains("@cse.mait.ac.in"))) {
          return "Enter email provided by College!";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Enter your college email",
        //errorText: "Enter email provided by College!",
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
          borderSide: BorderSide(color: AppColors.kPrimaryColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
          borderSide: BorderSide(color: AppColors.kPrimaryColor),
        ),
      ),
    );
  }

  TextFormField _rollNoField() {
    return TextFormField(
      controller: _rollControlller,
      decoration: InputDecoration(
        labelText: "Enter your Roll Number",
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
          borderSide: BorderSide(color: AppColors.kPrimaryColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
          borderSide: BorderSide(color: AppColors.kPrimaryColor),
        ),
      ),
    );
  }

  Widget setUpAlertDialogbox(List<Section> data) {
    return Container(
      width: 200,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: data.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              _studentMap['section'] = data[index].secName;
              Navigator.of(context).pop();
              Toast.show('${data[index].secName} selected', context);
            },
            child: ListTile(
              title: Center(child: Text('${data[index].secName}')),
            ),
          );
        },
      ),
    );
  }
}
