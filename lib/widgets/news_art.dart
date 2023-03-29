class NewsArt {
  String imgUrl;
  String newsHead;
  String newsDes;
  String newsCnt;
  String newsUrl;

  NewsArt(
      {required this.imgUrl,
      required this.newsCnt,
      required this.newsDes,
      required this.newsHead,
      required this.newsUrl});

  static NewsArt fromAPItoApp(Map<String, dynamic> article) {
    return NewsArt(
        imgUrl: article["urlToImage"] ??
            "https://img.freepik.com/free-photo/digital-world-map-hologram-blue-background_1379-901.jpg?w=900&t=st=1680030522~exp=1680031122~hmac=9c555dcbd29b265cebf80904423a83d67323a9c7a60fc86f3f7e5cfacc019a65",
        newsCnt: article["content"] ?? "--",
        newsDes: article["description"] ?? "--",
        newsHead: article["title"] ?? "--",
        newsUrl: article["url"] ??
            "https://news.google.com/topstories?hl=en-IN&gl=IN&ceid=IN:en");
  }
}
