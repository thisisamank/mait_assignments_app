import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'file:///C:/Users/Aman%20Kumar/Desktop/projects/mait_assignments_app/lib/logic/cubits/bloc/auth/authentication_bloc.dart';
import 'package:mait_assignments_app/data/model/user.dart';
import 'package:mait_assignments_app/data/provider/firebase_provider.dart';

class HomeScreen extends StatelessWidget {
  FirebaseProvider _firebaseProvider = FirebaseProvider(firestore: FirebaseFirestore.instance);

  UserModel user;
  HomeScreen({this.user});
  @override
  Widget build(BuildContext context) {
    _firebaseProvider.getSections();
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
