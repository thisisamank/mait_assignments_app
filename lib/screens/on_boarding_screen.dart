import 'package:flutter/material.dart';
import 'package:mait_assignments_app/config/config.dart';
import 'package:mait_assignments_app/widgets/global_widgets.dart';

class OnBoardingScreen extends StatefulWidget {
  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppWidgets.getAppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              onPressed: () {},
              child: Text(
                "Login as a Teacher",
                style: AppStyles.kButtonTextStyle(
                  color: Colors.white,
                ),
              ),
              color: AppColors.kPrimaryColor,
            ),
            MaterialButton(
              onPressed: () {
                Navigator.pushNamed(context, '/studentLogin');
              },
              child: Text(
                "Login as a Student ",
                style: AppStyles.kButtonTextStyle(
                  color: Colors.white,
                ),
              ),
              color: AppColors.kPrimaryColor,
            ),
          ],
        ),
      ),
      drawer: Drawer(),
    );
  }
}
