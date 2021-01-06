import 'package:flutter/material.dart';
import 'package:mait_assignments_app/config/config.dart';

class AppWidgets {
  static Widget getAppBarWithTitle({@required final String title}) {
    return AppBar(
      backgroundColor: AppColors.kPrimaryColor,
      centerTitle: true,
      title: Text(
        title,
        style: AppStyles.kHeadingTextStyle(
          color: Colors.white,
        ),
      ),
    );
  }

  static Widget getAppBar() {
    return AppBar(
      backgroundColor: AppColors.kPrimaryColor,
    );
  }
}
