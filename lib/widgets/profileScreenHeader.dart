// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

import '../constants.dart';

class ProfileScreenHeaderView extends StatelessWidget {
  const ProfileScreenHeaderView({
    Key? key,
    required this.headerHeight,
    required this.top,
    required this.profileAvatarHeight,
  }) : super(key: key);

  final double headerHeight;
  final double top;
  final double profileAvatarHeight;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        Container(
          margin: EdgeInsets.fromLTRB(0, 0, 0, 40),
          width: double.infinity,
          height: headerHeight,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(40),
              bottomRight: Radius.circular(40),
            ),
            gradient:appLinearGradient,
          ),
        ),
        Positioned(
          top: top,
          child: Container(
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(colors: [
                  Colors.cyanAccent,
                  Colors.deepPurpleAccent,
                  Colors.blueAccent,
                  Colors.deepPurpleAccent
                ])),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                foregroundColor: Colors.deepPurpleAccent,
                backgroundColor: Colors.white,
                radius: profileAvatarHeight,
                child: Text(
                  "P",
                  style: TextStyle(
                    color: Colors.deepPurpleAccent,
                    fontWeight: FontWeight.w600,
                    fontSize: profileAvatarHeight,
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
