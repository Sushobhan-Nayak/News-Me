// ignore_for_file: file_names, must_be_immutable, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:news_me/screens/detail_view.dart';

class NewsContainer extends StatelessWidget {
  String imageUrl;
  String newsHead;
  String newsDescr;
  String newsUrl;
  String newsCnt;
  NewsContainer(
      {super.key,
      required this.imageUrl,
      required this.newsDescr,
      required this.newsHead,
      required this.newsUrl,
      required this.newsCnt});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          FadeInImage(
            fadeOutDuration: Duration(milliseconds: 100),
            fadeInDuration: Duration(milliseconds: 200),
            placeholder: AssetImage('assets/images/loading.gif'),
            image: NetworkImage(imageUrl),
            height: 300,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: Column(children: [
              SizedBox(
                height: 10,
              ),
              Text(
                newsHead,
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 12,
              ),
              Text(newsDescr,
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 15, color: Colors.grey[700])),
              SizedBox(
                height: 15,
              ),
              Text(
                  newsCnt.length > 20
                      ? '${newsCnt.substring(0, newsCnt.length - 15)}...'
                      : newsCnt,
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 18))
            ]),
          ),
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DetailView(
                                  newsUrl: newsUrl,
                                )));
                  },
                  child: Text('Read more'),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}
