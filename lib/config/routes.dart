import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mait_assignments_app/bloc/login/login_bloc.dart';
import 'package:mait_assignments_app/screens/home_screen.dart';
import 'package:mait_assignments_app/screens/login/teacher_login.dart';
import 'package:mait_assignments_app/screens/on_boarding_screen.dart';
import 'package:mait_assignments_app/screens/splash.dart';
import 'package:mait_assignments_app/screens/student_login.dart';

import '../main.dart';

Map<String, WidgetBuilder> getRoutes(userRepository) {
  return {
    '/home': (newContext) => HomeScreen(),
    '/': (newContext) => App(),
    '/splash': (newContext) => SplashScreen(),
    '/login': (newContext) => OnBoardingScreen(),
    '/studentLogin': (newContext) => BlocProvider<LoginBloc>(
          create: (newContext) => LoginBloc(userRepository),
          child: StudentLogin(),
        ),
    '/teacherLogin': (newContext) => BlocProvider<LoginBloc>(
          create: (newContext) => LoginBloc(userRepository),
          child: TeacherLogin(),
        ),
  };
}
