import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mait_assignments_app/data/model/user.dart';
import 'package:mait_assignments_app/data/provider/user_provider.dart';

class UserRepository {

  UserProvider _userProvider=UserProvider();

  Future<UserModel> signInWithGoogle() async {
    final User user=await _userProvider.signInWithGoogle();
    final userModel =  UserModel.fromFirebase(user);
    return userModel;
  }

  Future<UserModel> signInWithCredentials(String email, String password) async {
    final User user=await _userProvider.signInWithCredentials(email, password);
    final userModel = UserModel.fromFirebase(user);
    return userModel;
  }

  Future<void> signOut() async {
    await _userProvider.signOut();
    return null;
  }

  Future<bool> isSignedIn() async {
    final isSignedIn =  await _userProvider.isSignedIn();
    return isSignedIn;

  }

  Future<UserModel> getUser() async {
    final User user = await _userProvider.getUser();
    final userModel= UserModel.fromFirebase(user);
    return userModel;
  }

  Future<String> getUserName() async {
    final name =  (await _userProvider.getUser()).displayName;
    return name;

  }
}
