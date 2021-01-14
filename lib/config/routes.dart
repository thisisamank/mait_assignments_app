import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mait_assignments_app/logic/bloc/login/login_bloc.dart';
import 'package:mait_assignments_app/logic/cubits/register_student/register_students_cubit.dart';
import 'package:mait_assignments_app/logic/cubits/sections/sections_cubit.dart';
import 'package:mait_assignments_app/screens/home_screen.dart';
import 'package:mait_assignments_app/screens/on_boarding_screen.dart';
import 'package:mait_assignments_app/screens/splash.dart';
import 'package:mait_assignments_app/screens/teacher_login/teacher_login.dart';
import 'file:///C:/Users/Aman%20Kumar/Desktop/projects/mait_assignments_app/lib/screens/student_login/student_login.dart';
import 'file:///C:/Users/Aman%20Kumar/Desktop/projects/mait_assignments_app/lib/screens/student_login/student_register.dart';

import '../main.dart';

Map<String, WidgetBuilder> getRoutes() {
  return {
    '/home': (newContext) => HomeScreen(),
    '/': (newContext) => App(),
    '/splash': (newContext) => SplashScreen(),
    '/login': (newContext) => OnBoardingScreen(),
    '/studentLogin': (newContext) => BlocProvider<LoginBloc>(
          create: (newContext) => LoginBloc(),
          child: StudentLogin(),
        ),
    '/registerStudent': (newContext) => MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (newContext) => RegisterStudentsCubit(),
            ),
            BlocProvider(
              create: (newContext) => SectionsCubit(),
            )
          ],
          child: RegisterStudentScreen(),
        ),
    '/teacherLogin': (newContext) => BlocProvider<LoginBloc>(
          create: (newContext) => LoginBloc(),
          child: TeacherLogin(),
        ),
  };
}
