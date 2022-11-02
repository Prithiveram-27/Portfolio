// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio_app/providers/googleSignInProvider.dart';
import 'package:portfolio_app/widgets/AppDrawer.dart';
import 'package:provider/provider.dart';

import '../constants.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  String? getGreeting() {
    var hour = DateTime.now().hour;
    if (hour < 12) {
      return 'Good Morning';
    } else if (hour >= 12 && hour < 16) {
      return 'Good Afternoon';
    } else if (hour >= 16) {
      return 'Good Evening';
    }
  }

  @override
  Widget build(BuildContext context) {
    final currentUser = FirebaseAuth.instance.currentUser;
    final greetMessage = getGreeting();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        iconTheme: IconThemeData(color: Colors.white),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: appLinearGradient,
          ),
        ),
      ),
      drawer: AppDrawer(),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
        onTap: (index) {
          if (index == 1) {
            Navigator.of(context).pushNamed("/ProfileScreen");
          }
        },
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
            child: Text(
              greetMessage! + " " + (currentUser?.displayName).toString(),
              style: TextStyle(
                fontFamily: "Satisfy-Regular",
                fontSize: 22,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
