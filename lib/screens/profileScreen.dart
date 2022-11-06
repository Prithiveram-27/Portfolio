// ignore_for_file: prefer_const_constructors, sort_child_properties_last, prefer_const_literals_to_create_immutables, prefer_const_constructors_in_immutables, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:portfolio_app/providers/updateProfileProvider.dart';
import 'package:portfolio_app/widgets/AppDrawer.dart';

import '../constants.dart';
import '../widgets/ProfileScreenDetailsView.dart';
import '../widgets/profileScreenHeader.dart';

class ProfileScreen extends StatelessWidget {
  final UserDetails userDetails;

  ProfileScreen(this.userDetails);

  static var routeName = "/ProfileScreen";

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double headerHeight = height / 8;
    double profileAvatarHeight = headerHeight / 3;
    double top = headerHeight - profileAvatarHeight - 10;

    return Scaffold(
      body: Scaffold(
        appBar: AppBar(
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.white),
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: appLinearGradient,
            ),
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                ProfileScreenHeaderView(
                  headerHeight: headerHeight,
                  top: top,
                  profileAvatarHeight: profileAvatarHeight,
                ),
                SizedBox(
                  height: 10,
                ),
                ProfileDetailsView(height, userDetails),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
