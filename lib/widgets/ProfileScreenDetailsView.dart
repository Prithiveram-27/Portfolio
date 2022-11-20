// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, sort_child_properties_last, use_key_in_widget_constructors, must_be_immutable, unnecessary_null_comparison, prefer_if_null_operators

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio_app/providers/updateProfileProvider.dart';
import 'package:provider/provider.dart';

import '../constants.dart';

class ProfileDetailsView extends StatelessWidget {
  double screenHeight;
  ProfileDetailsView(this.screenHeight);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
      child: Column(
        children: [
          NameAndDesignation(),
          MediaData(),
          PersonalData(screenHeight),
        ],
      ),
    );
  }
}

class PersonalData extends StatefulWidget {
  double screenHeight;
  PersonalData(this.screenHeight);

  @override
  State<PersonalData> createState() => _PersonalDataState();
}

class _PersonalDataState extends State<PersonalData> {
  var userData;

  @override
  void initState() {
    super.initState();
    //getUserDetails(context);
  }

  Future<void> getUserDetails(BuildContext context) async {
    await Provider.of<UpdateProfileDetails>(context, listen: false)
        .getUserDetails();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getUserDetails(context),
      builder: ((BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Consumer<UpdateProfileDetails>(
            builder: (context, user, _) => Container(
              height: widget.screenHeight / 2,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  elevation: 2,
                  //color: Colors.red,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Icon(Icons.phone_android),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              user.userData.length > 0
                                  ? user.userData[0].phNo.toString()
                                  : "Not updated",
                              style: TextStyle(
                                fontFamily: "Lato-Regular",
                                color: Color.fromRGBO(115, 115, 115, 1),
                              ),
                            )
                          ],
                        ),
                        Divider(),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Icon(Icons.mail),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              user.userData.length > 0
                                  ? user.userData[0].email.toString()
                                  : "Not updated",
                              style: personalDataTheme,
                            )
                          ],
                        ),
                        Divider(),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Text(
                              "About: ",
                              style: personalDataHeadingTheme,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                                child: Text(
                              user.userData.length > 0
                                  ? user.userData[0].userDesc.toString()
                                  : "Not updated",
                              style: personalDataTheme,
                            ))
                          ],
                        ),
                        Divider(),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Text(
                              "Technologies:",
                              style: personalDataHeadingTheme,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              user.userData.length > 0
                                  ? user.userData[0].knownTechnologies
                                      .toString()
                                  : "Not updated",
                              style: personalDataTheme,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        }
        return Container();
      }),
    );
  }
}

class MediaData extends StatelessWidget {
  const MediaData({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(15, 10, 0, 15),
      height: 120,
      child: GridView(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 10,
          crossAxisSpacing: 20,
        ),
        children: [
          Card(
            child: GridTile(
              child: Center(
                child: FaIcon(
                  FontAwesomeIcons.github,
                  size: 40.0,
                ),
              ),
              footer: Center(
                child: Text(
                  "Repos: 10",
                  style: mediaDataTextTheme,
                ),
              ),
            ),
          ),
          Card(
            child: GridTile(
              child: Center(
                child: FaIcon(
                  FontAwesomeIcons.linkedin,
                  color: Colors.blue,
                  size: 40.0,
                ),
              ),
              footer: Center(
                  child: Text(
                "Connections: 211",
                style: mediaDataTextTheme,
              )),
            ),
          ),
          Card(
            child: GridTile(
              child: Center(
                child: FaIcon(
                  FontAwesomeIcons.stackOverflow,
                  color: Colors.orange,
                  size: 40.0,
                ),
              ),
              footer: Center(
                child: Text(
                  "12/25",
                  style: mediaDataTextTheme,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class NameAndDesignation extends StatelessWidget {
  const NameAndDesignation({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        Text(
          "Prithiveram C",
          style: TextStyle(fontSize: 24),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          "Software Developer",
          style: TextStyle(
            fontSize: 20,
            color: Colors.grey,
          ),
        )
      ],
    ));
  }
}
