import 'package:flutter/material.dart';
import 'package:news_me/controller/fetchNews.dart';
import 'package:news_me/widgets/NewsContainer.dart';
import 'package:news_me/widgets/news_art.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isLoading = true;
  late NewsArt newsArt;

  getNews() async {
    newsArt = await FetchNews.fetchNews();
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    getNews();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        scrollDirection: Axis.vertical,
        onPageChanged: (value) {
          setState(() {
            isLoading = true;
          });
          getNews();
        },
        itemBuilder: (context, index) {
          return isLoading
              ?  Center(
                  child: CircularProgressIndicator(),
                )
              : NewsContainer(
                  newsCnt: newsArt.newsCnt,
                  newsDescr: newsArt.newsDes,
                  newsUrl: newsArt.newsUrl,
                  newsHead: newsArt.newsHead,
                  imageUrl: newsArt.imgUrl,
                );
        },
      ),
    );
  }
}
