import 'package:flutter/material.dart';
import 'package:mait_assignments_app/bloc/auth/authentication_bloc.dart';
import 'package:mait_assignments_app/config/config.dart';
import 'package:mait_assignments_app/data/models/user_repository.dart';
import 'package:mait_assignments_app/widgets/global_widgets.dart';

class StudentLogin extends StatefulWidget {
  @override
  _StudentLoginState createState() => _StudentLoginState();
}

class _StudentLoginState extends State<StudentLogin> {
  final UserRepository _userRepository = UserRepository();
  AuthenticationBloc _authenticationBloc;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppWidgets.getAppBar(),
      body: Center(
        child: MaterialButton(
          onPressed: () {},
          color: AppColors.kPrimaryColor,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                AppImages.google,
                width: 25,
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                "Login With Google",
                style: AppStyles.kButtonTextStyle(
                  color: Colors.white,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
