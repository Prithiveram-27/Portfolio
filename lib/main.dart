// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_app/screens/editProfileScreen.dart';
import 'package:portfolio_app/screens/landing.dart';
import 'package:portfolio_app/screens/profileScreen.dart';
import 'package:provider/provider.dart';
import 'dart:async';
import './screens/splash_screen.dart';
import './screens/pagecontroller.dart';
import 'package:firebase_core/firebase_core.dart';
import './providers/googleSignInProvider.dart';
import 'providers/updateProfileProvider.dart';
import 'screens/homePage.dart';
import './constants.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => GoogleSignInProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => UpdateProfileDetails("", "", []),
        ),
      ],
      child: Consumer<GoogleSignInProvider>(
          builder: (context, auth, _) => MaterialApp(
                title: 'Flutter Demo',
                theme: ThemeData(fontFamily: "Anton-Regular"),
                home: LandingPage(),
                initialRoute: "/",
                routes: {
                  ProfileScreen.routeName: (context) => ProfileScreen(),
                  EditProfileScreen.routeName: (context) => EditProfileScreen(),
                },
              )),
    );
  }
}
