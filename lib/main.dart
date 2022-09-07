import 'package:flutter/material.dart';
import './screens/Home_Screen.dart';
import './screens/Auth_Screen.dart';
import 'dart:async';
import './screens/signup_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AuthScreen(),
      routes: {
        SignUpScreen.routeName: (context) => SignUpScreen(), 
      },
    );
  }
}
