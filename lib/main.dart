import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mait_assignments_app/config/routes.dart';
import 'package:mait_assignments_app/screens/on_boarding_screen.dart';
import 'file:///C:/Users/Aman%20Kumar/Desktop/projects/mait_assignments_app/lib/screens/student_login/student_register.dart';

import 'logic/cubits/bloc/auth/authentication_bloc.dart';
import 'bloc/student_register/students_bloc.dart';
import 'data/repository/user_repository.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  UserRepository userRepository = UserRepository();
  AuthenticationBloc _authenticationBloc;

  @override
  void initState() {



    _authenticationBloc = AuthenticationBloc(userRepository);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthenticationBloc>(
      create: (context) => _authenticationBloc,
      child: MaterialApp(
        routes: getRoutes(userRepository),
      ),
    );
  }
}

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  void initState() {
    BlocProvider.of<AuthenticationBloc>(context).add(AuthenticationStarted());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
      builder: (context, state) {
        if (state is AuthenticationSuccess) {
          return BlocProvider<StudentsBloc>(
            create: (context) => StudentsBloc(),
            child: RegisterStudentScreen(),
          );
        } else if (state is AuthenticationFailure) {
          return OnBoardingScreen();
        } else {
          return OnBoardingScreen();
        }
      },
    );
  }
}
