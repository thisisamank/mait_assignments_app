import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mait_assignments_app/bloc/login/login_bloc.dart';
import 'package:mait_assignments_app/repository/user_repository.dart';
import 'package:mait_assignments_app/screens/home_screen.dart';
import 'package:mait_assignments_app/screens/on_boarding_screen.dart';
import 'package:mait_assignments_app/screens/splash.dart';
import 'package:mait_assignments_app/screens/student_login.dart';

import 'bloc/auth/authentication_bloc.dart';

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
  LoginBloc _loginBloc;
  @override
  void initState() {
    _authenticationBloc = AuthenticationBloc(userRepository);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthenticationBloc>(
      create: (context) => AuthenticationBloc(userRepository),
      child: MaterialApp(
        routes: {
          '/': (newContext) => App(),
          '/splash': (newContext) => SplashScreen(),
          '/login': (newContext) => OnBoardingScreen(),
          '/studentLogin': (newContext) => BlocProvider<LoginBloc>(
                create: (newContext) => LoginBloc(userRepository),
                child: StudentLogin(),
              ),
        },
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
    BlocProvider.of<AuthenticationBloc>(context).add(AppStarted());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
      builder: (context, state) {
        if (state is AuthenticatedAuthState) {
          return SplashScreen();
        } else if (state is UnAuthenticatedAuthState) {
          return OnBoardingScreen();
        } else {
          return Text("Something Went Wrong");
        }
      },
    );
  }
}
