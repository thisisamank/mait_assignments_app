import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mait_assignments_app/bloc/login/login_bloc.dart';
import 'package:toast/toast.dart';

class TeacherLogin extends StatefulWidget {
  @override
  _TeacherLoginState createState() => _TeacherLoginState();
}

class _TeacherLoginState extends State<TeacherLogin> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    return Scaffold(body: BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        if (state is LoginInitial) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _emailController,
                      decoration: InputDecoration(
                          icon: Icon(FontAwesomeIcons.personBooth),
                          hintText: "Enter Your Email"),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter your email';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: _passwordController,
                      decoration: InputDecoration(
                          icon: Icon(FontAwesomeIcons.lock),
                          hintText: "Enter Your Password"),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter your password';
                        }
                        return null;
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState.validate()) {
                            final email = _emailController.text;
                            final password = _passwordController.text;

                            BlocProvider.of<LoginBloc>(context).add(
                              LoginWithCredentials(
                                  email: email, password: password),
                            );
                          }
                        },
                        child: Text('Submit'),
                      ),
                    ),
                  ],
                ),
              )
            ],
          );
        } else if (state is LoginLoading) {
          // Scaffold.of(context).showSnackBar(
          //   SnackBar(content: Text("Logging In")),
          // );
        } else if (state is LoginSuccess) {
          Navigator.pushNamed(context, '/home');
          return null;
        } else if (state is LoginFailure) {
           Toast.show("Login Error...please check password!", context);
           return null;
        }
        return Container();
      },
    ));
  }
}
