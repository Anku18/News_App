import 'package:flutter/material.dart';

import 'package:new_article/viewmodels/newsArticleViewModel.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NewsArticleDetailsPage extends StatelessWidget {
  final NewsArticleViewModel article;

  NewsArticleDetailsPage({required this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrangeAccent,
        title: Text(
          article.title.toString(),
        ),
      ),
      body: WebView(initialUrl: article.url),
    );
  }
}
