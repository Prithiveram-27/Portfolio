// ignore_for_file: unused_local_variable

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';

class GoogleSignInProvider with ChangeNotifier {
  final googleSignIn = GoogleSignIn();
  var _token;

  GoogleSignInAccount? _user;
  GoogleSignInAccount get user => _user!;

  bool get isAuth {
    if (_token != "" && _token != null) {
      return true;
    }
    return false;
  }

  Future googleLogin() async {
    try {
      final googleUser = await googleSignIn.signIn();
      if (googleUser == null) return;
      _user = googleUser;

      final googleAuth = await googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      _token = googleAuth.idToken;
      await FirebaseAuth.instance.signInWithCredential(credential);
    } catch (e) {
      print(e.toString());
    }

    notifyListeners();
  }

  Future googleLogout() async {
    try {
      // await googleSignIn.disconnect();
      await FirebaseAuth.instance.signOut();
      await googleSignIn.signOut();
      await googleSignIn.disconnect();

    } catch (e) {
      print(e.toString());
    }
  }
}

