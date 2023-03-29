// ignore_for_file: must_be_immutable
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class DetailView extends StatefulWidget {
  String newsUrl;
  DetailView({super.key, required this.newsUrl});

  @override
  State<DetailView> createState() => _DetailViewState();
}

class _DetailViewState extends State<DetailView> {
  final Completer<WebViewController> controller =
      Completer<WebViewController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('News-Me')),
      body: WebView(
          initialUrl: widget.newsUrl,
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (WebViewController webViewController) {
            setState(() {
              controller.complete(webViewController);
            });
          }),
    );
  }
}
