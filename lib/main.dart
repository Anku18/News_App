import 'package:flutter/material.dart';
import 'package:new_article/screens/newsListPage.dart';
import 'package:new_article/viewmodels/newsArticleListViewModel.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News Articles',
      debugShowCheckedModeBanner: false,
      home: ChangeNotifierProvider(
        create: (context) => NewsArticleListViewModel(),
        child: NewsListPage(),
      ),
    );
  }
}
