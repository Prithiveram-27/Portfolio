// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/updateProfileProvider.dart';
import '../screens/pagecontroller.dart';
import 'homePage.dart';

class LandingPage extends StatelessWidget {
  var userDetails = UserDetails(
    name: "",
    phNo: "",
    email: "",
    knownTechnologies: "",
    userDesc: "",
  );
  var email;

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
            User? user = snapshot.data as User?;
            userDetails = UserDetails(
                  name: user!.displayName ?? "",
                  phNo: user.phoneNumber ?? "",
                  email: user.email ?? "",
                  knownTechnologies: "",
                  userDesc: "",
            );
            // final provider =
            //     Provider.of<UpdateProfileDetails>(context, listen: false);
            // provider.addUsersProfileDetails(userDetails);
            return HomePage();
          } else {
            return MyPageView();
          }
          return MyPageView();
        });
  }
}
