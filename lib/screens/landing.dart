// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../screens/pagecontroller.dart';
import 'homePage.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            Center(
              child: Text("Something Went wrong"),
            );
          } else if (snapshot.hasData) {
            return HomePage();
          } else {
            return MyPageView();
          }
          return MyPageView();
        });
  }
}
