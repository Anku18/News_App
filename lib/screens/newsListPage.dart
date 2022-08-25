import 'package:flutter/material.dart';
import 'package:new_article/widgets/newList.dart';

import 'package:provider/provider.dart';

import '../viewmodels/newsArticleListViewModel.dart';
import '../viewmodels/newsArticleViewModel.dart';
import 'newsArticleDetailsPage.dart';

class NewsListPage extends StatefulWidget {
  const NewsListPage({Key? key}) : super(key: key);

  @override
  _NewsListPageState createState() => _NewsListPageState();
}

class _NewsListPageState extends State<NewsListPage> {
  final _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    Future.microtask(() =>
        Provider.of<NewsArticleListViewModel>(context, listen: false)
            .populateTopHeadlines());
  }

  void _showNewsArticleDetails(
      BuildContext context, NewsArticleViewModel article) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => NewsArticleDetailsPage(article: article),
      ),
    );
  }

  Widget _buildList(BuildContext context, NewsArticleListViewModel vm) {
    switch (vm.loadingStatus) {
      case LoadingStatus.searching:
        return const Center(
          child: CircularProgressIndicator(),
        );

      case LoadingStatus.empty:
        return const Align(
          child: Text('No results found!'),
        );

      case LoadingStatus.completed:
        return Expanded(
          child: NewsList(
            articles: vm.articles,
            onSelected: (article) {
              _showNewsArticleDetails(context, article);
            },
          ),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<NewsArticleListViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Top News"),
        centerTitle: true,
        backgroundColor: Colors.deepOrangeAccent,
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 6, vertical: 5),
            decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey, //color of border
                  width: 2, //width of border
                ),
                borderRadius: BorderRadius.circular(25)),
            child: TextField(
              onSubmitted: (value) {
                if (value.isNotEmpty) {
                  vm.search(value);
                }
              },
              controller: _controller,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Search News here',
                prefixIcon: const Icon(Icons.search),
                suffixIcon: IconButton(
                  onPressed: () {
                    _controller.clear();
                  },
                  icon: const Icon(Icons.clear),
                ),
              ),
            ),
          ),
          _buildList(context, vm),
        ],
      ),
    );
  }
}
