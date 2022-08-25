import 'package:flutter/material.dart';

import 'package:new_article/viewmodels/newsArticleViewModel.dart';

import '../models/newArticle.dart';
import '../services/webservices.dart';

enum LoadingStatus {
  completed,
  searching,
  empty,
}

class NewsArticleListViewModel extends ChangeNotifier {
  var loadingStatus = LoadingStatus.searching;
  List<NewsArticleViewModel> articles = <NewsArticleViewModel>[];

  Future<void> search(String keyword) async {
    loadingStatus = LoadingStatus.searching;
    notifyListeners();
    List<NewsArticle> newsArticles =
        await Webservice().fetchHeadlinesByKeyword(keyword);

    articles = newsArticles
        .map((article) => NewsArticleViewModel(article: article))
        .toList();
    loadingStatus =
        articles.isEmpty ? LoadingStatus.empty : LoadingStatus.completed;
    notifyListeners();
  }

  Future<void> populateTopHeadlines() async {
    loadingStatus = LoadingStatus.searching;
    notifyListeners();
    List<NewsArticle> newsArticles = await Webservice().fetchTopHeadlines();
    articles = newsArticles
        .map((article) => NewsArticleViewModel(article: article))
        .toList();
    loadingStatus =
        articles.isEmpty ? LoadingStatus.empty : LoadingStatus.completed;
    notifyListeners();
  }
}
