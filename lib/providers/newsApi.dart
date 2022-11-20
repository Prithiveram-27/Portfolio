import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/newsSource.dart';

class NewsApiService {
  final endPointUrl = "newsapi.org";
  final client = http.Client();

  Future<List> getArticle() async {
    final queryParameters = {
      'country': 'in',
      'apiKey': '19727bb4896c42e3a71081f286b07530'
    };
    final uri = Uri.https(endPointUrl, '/v2/top-headlines', queryParameters);
    final response = await client.get(uri);
    Map<String, dynamic> jsondata = json.decode(response.body);
    List<dynamic> body = jsondata['articles'];
    // List<Article> articles = getListMap(body);
    //body.map((dynamic item) => Article.fromJson(item)).toList();
    return body;
  }
}
