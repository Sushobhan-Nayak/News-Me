// ignore_for_file: file_names

import 'dart:convert';
import 'dart:math';
import 'package:http/http.dart';

import '../widgets/news_art.dart';

class FetchNews {
  static List sourceId = [
    "the-times-of-india",
    "abc-news",
    "bbc-news",
    "espn",
    "espn-cric-info",
    "google-news",
    "google-news-in",
    "news24",
    "the-hindu",
  ];

  static Future<NewsArt> fetchNews() async {
    final random = Random();
    var element = sourceId[random.nextInt(sourceId.length)];
    print(element);
    Response response = await get(Uri.parse(
        'https://newsapi.org/v2/top-headlines?sources=$element&apiKey=d696787707d94908b052c0018bf40b79'));
    Map bodyData = jsonDecode(response.body);
    List articles = bodyData['articles'];
    final nextrandom = Random();
    var randomarticle = articles[nextrandom.nextInt(sourceId.length)];
    return NewsArt.fromAPItoApp(randomarticle);
  }
}
