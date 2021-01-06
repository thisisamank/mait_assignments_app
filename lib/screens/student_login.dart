import 'package:flutter/material.dart';
import 'package:mait_assignments_app/config/config.dart';
import 'package:mait_assignments_app/widgets/global_widgets.dart';

class StudentLogin extends StatelessWidget {
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
