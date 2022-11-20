// ignore_for_file: prefer_const_constructors, unused_local_variable

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:portfolio_app/constants.dart';

import '../providers/newsApi.dart';

class NewsOverView extends StatelessWidget {
  static const routeName = "/NewsOverviewScreen";

  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)!.settings.arguments as dynamic;
    var now = new DateTime.now();
    var dateFormatted = DateTime.parse(arguments['publishedAt'].toString());
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: appLinearGradient,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: 1,
          itemBuilder: (context, index) => Column(
            children: [
              Container(
                height: 200.0,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(arguments['urlToImage'].toString()),
                      fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text("published At: "),
                  Text(dateFormatted.toString()),
                ],
              ),
              arguments['author'].toString() != "null"
                  ? Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text("Author: "),
                          Text(arguments['author'].toString()),
                        ],
                      ),
                    )
                  : Row(
                      children: [],
                    ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  arguments['title'].toString(),
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(arguments['content'].toString()),
              )
            ],
          ),
        ),
      ),
    );
  }
}
