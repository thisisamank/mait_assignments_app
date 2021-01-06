import 'package:flutter/cupertino.dart';

class AppColors {
  static final kPrimaryColor = Color(0xFF356DBF);
  static final kOnPrimaryTextColor = Color(0xFFFFFFFF);
  static final kSecondaryColor = Color(0xFF03DAC5);
  static final kHeadingColor = Color(0xDE000000);
  static final kSubtitleColor = Color(0x99000000);
  static final kErrorColor = Color(0xFFB00020);
}

class AppStyles {
  static kHeadingTextStyle({color}) {
    return TextStyle(
      color: color,
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w500,
      letterSpacing: 0.15,
      //height: 24,
      fontSize: 20,
    );
  }

  static final kSubtitleTextStyle = TextStyle(
    color: AppColors.kOnPrimaryTextColor,
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w500,
    letterSpacing: 0.15,
    height: 24,
    fontSize: 20,
  );
  static final kTitleTextStyle = TextStyle(
    color: AppColors.kOnPrimaryTextColor,
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w500,
    letterSpacing: 0.15,
    height: 24,
    fontSize: 20,
  );
  static kButtonTextStyle({color}) {
    return TextStyle(
      color: color,
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w500,
      letterSpacing: 1.25,
      fontSize: 14,
    );
  }
}

class AppImages {
  static final tick = 'assets/images/icons/tick.png';
  static final google = 'assets/images/icons/google.png';
  static final subjectIcon = 'assets/images/icons/circle-subject.png';
}
