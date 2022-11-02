// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, sort_child_properties_last, use_key_in_widget_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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

class PersonalData extends StatelessWidget {
  double screenHeight;
  PersonalData(this.screenHeight);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenHeight / 2,
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
                      ": +919629683161",
                      style: TextStyle(
                        fontFamily: "Satisfy-Regular",
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
                      ": prithiveram.chandrasekaran@gmail.com",
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
                      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged",
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
                    FaIcon(
                      FontAwesomeIcons.swift,
                      color: Colors.orange,
                    ),
                    Text(
                      " ,Flutter , C++, ",
                      style: personalDataTheme,
                    ),
                    FaIcon(
                      FontAwesomeIcons.node,
                      color: Colors.green,
                    ),
                    SizedBox(
                      width: 3,
                    ),
                    FaIcon(
                      FontAwesomeIcons.docker,
                      color: Colors.blue,
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
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
