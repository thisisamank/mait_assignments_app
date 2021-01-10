import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mait_assignments_app/bloc/auth/authentication_bloc.dart';
import 'package:mait_assignments_app/data/model/user.dart';

class HomeScreen extends StatelessWidget {

  UserModel user;
  HomeScreen({this.user});
  @override
  Widget build(BuildContext context) {
    final UserModel args = ModalRoute.of(context).settings.arguments;
    final name = args!=null? args.name : user.name;
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () {
              BlocProvider.of<AuthenticationBloc>(context).add(AuthenticationLoggedOut());
            },
          )
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Center(child: Text('Welcome! ${name}')),
        ],
      ),
    );
  }
}
