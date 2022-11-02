import 'package:flutter/material.dart';

class cardGridWidget extends StatelessWidget {
  const cardGridWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
        ),
        itemCount: 4,
        itemBuilder: ((context, index) {
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
      ),
    );
  }
}
