// ignore_for_file: prefer_const_constructors, sort_child_properties_last, unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:portfolio_app/models/newsSource.dart';
import 'package:portfolio_app/providers/newsApi.dart';

import '../constants.dart';

class NewsScreen extends StatelessWidget {
  NewsApiService client = NewsApiService();

  static const routeName = "/NewsScreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: appLinearGradient,
          ),
        ),
      ),
      body: FutureBuilder(
        future: client.getArticle(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            List<dynamic> article = snapshot.data!;
            return ListView.builder(
              itemCount: article.length,
              itemBuilder: (context, index) {
                return NewsCard(
                  article[index],
                );
              },
            );
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

class NewsCard extends StatelessWidget {
  // final String title;
  // final String imgUrl;
  final dynamic articles;

  NewsCard(this.articles);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        child: Card(
          child: Column(
            children: [
              (articles["urlToImage"] != null && articles["urlToImage"] != "")
                  ? Container(
                      height: 200.0,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(articles["urlToImage"]),
                            fit: BoxFit.cover),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    )
                  : Container(
                      height: 200.0,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(
                                "https://source.unsplash.com/weekly?coding"),
                            fit: BoxFit.cover),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  articles["title"],
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 15,
              )
            ],
          ),
        ),
        onTap: (() {
          Navigator.of(context)
              .pushNamed("/NewsOverviewScreen", arguments: articles);
        }),
      ),
    );
  }
}
