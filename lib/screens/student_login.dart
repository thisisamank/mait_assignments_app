import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mait_assignments_app/bloc/login/login_bloc.dart';
import 'package:mait_assignments_app/config/config.dart';
import 'package:mait_assignments_app/widgets/global_widgets.dart';

class StudentLogin extends StatefulWidget {
  @override
  _StudentLoginState createState() => _StudentLoginState();
}

class _StudentLoginState extends State<StudentLogin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppWidgets.getAppBar(),
      body: Center(
        child: BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
          if (state is LoginInitial) {
            return MaterialButton(
              onPressed: () {
                BlocProvider.of<LoginBloc>(context).add(LoginWithGoogle());
              },
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
                  ),
                ],
              ),
            );
          } else if (state is LoginLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is LoginSuccess) {
            Navigator.pushNamed(context, '/home', arguments: state.user);
            return Text("Logged In");
          } else {
            return Text("Error !");
          }
        }),
      ),
    );
  }
}
