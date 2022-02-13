import 'package:firebase_auth/firebase_auth.dart';

import '../models/user_model.dart';


class AuthRepo {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  AuthRepo();

  Future<UserModel> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    var authResult = await _auth.signInWithEmailAndPassword(
        email: email, password: password);
    return UserModel(authResult.user!.uid,
        displayName: authResult.user?.displayName);
  }

  Future<UserModel> getUser() async {
    var firebaseUser = _auth.currentUser;

    return UserModel(firebaseUser!.uid,
        displayName: firebaseUser.displayName);
  }

  Future<void> updateDisplayName(String displayName) async {
    var user = _auth.currentUser;

    var display = displayName;

    user?.updateDisplayName(display);
  }

  Future<bool> validatePassword(String password) async {
    var firebaseUser = _auth.currentUser;

   // var authCredentials = EmailAuthProvider.credential(email: firebaseUser.email, password: password)

    // try {
    //   var authResult = await firebaseUser
    //       ?.reauthenticateWithCredential(authCredentials);
    //   return authResult?.user != null;
    // } catch (e) {
    //   print(e);
    //   return false;
    // }
    return false;
  }

  Future<void> updatePassword(String password) async {
    var firebaseUser = _auth.currentUser;
    firebaseUser?.updatePassword(password);
  }
}
