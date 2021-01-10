import 'package:firebase_auth/firebase_auth.dart';

class UserModel {
  final photoUrl;
  final name;
  final email;
  final uid;
  UserModel({this.email, this.name, this.uid,this.photoUrl});
  factory UserModel.fromFirebase(User rawUser){
    return UserModel(
      uid: rawUser.uid,
      name: rawUser.displayName,
      email: rawUser.email,
      photoUrl: rawUser.photoURL,
    );
  }
}
