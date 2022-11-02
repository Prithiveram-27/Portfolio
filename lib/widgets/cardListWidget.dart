// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class cardListWidget extends StatelessWidget {
  const cardListWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
          itemCount: 3,
          itemBuilder: (context, index) {
            return Card(
              elevation: 10,
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: ListTile(
                leading: CircleAvatar(
                  child: Image.asset('assets/imsges/login.jpg'),
                ),
                title: Text("Project 1"),
                subtitle: Text("This Project is about ..."),
                trailing: Icon(Icons.delete),
              ),
            );
          }),
    );
  }
}
