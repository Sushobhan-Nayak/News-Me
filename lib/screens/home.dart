import 'package:flutter/material.dart';
import 'package:news_me/controller/fetchNews.dart';
import 'package:news_me/widgets/NewsContainer.dart';
import 'package:news_me/widgets/news_art.dart';
import 'package:awesome_notifications/awesome_notifications.dart';

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

  callNotification() async {
    String localTimeZone =
        await AwesomeNotifications().getLocalTimeZoneIdentifier();
    String utcTimeZone =
        await AwesomeNotifications().getLocalTimeZoneIdentifier();
    AwesomeNotifications().createNotification(
      content: NotificationContent(
          id: 10,
          channelKey: 'scheduled',
          title: 'Time for some news !!!',
          body:
              'Its been a long time you have seen any news.Time to read some current headlines.'),
      schedule: NotificationInterval(
          interval: 3600, timeZone: localTimeZone, repeats: false),
    );
  }

  @override
  void initState() {
    AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
      if (!isAllowed) {
        AwesomeNotifications().requestPermissionToSendNotifications();
      }
    });
    callNotification();
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
              ? const Center(
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
