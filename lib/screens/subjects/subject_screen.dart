import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mait_assignments_app/logic/cubits/subjects/subject_cubit.dart';
import 'package:mait_assignments_app/widgets/global_widgets.dart';

class SubjectScreen extends StatefulWidget {
  @override
  _SubjectScreenState createState() => _SubjectScreenState();
}

class _SubjectScreenState extends State<SubjectScreen> {

  @override
  void initState() {
    //BlocProvider.of<SubjectCubit>(context).getSubjects(sectionName: )
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppWidgets.getAppBar(),

    );
  }
}
