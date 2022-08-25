import 'package:flutter/material.dart';
import 'package:new_article/viewmodels/newsArticleViewModel.dart';

class NewsList extends StatelessWidget {
  final List<NewsArticleViewModel> articles;
  final Function(NewsArticleViewModel article) onSelected;

  NewsList({required this.articles, required this.onSelected});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: articles.length,
      itemBuilder: (context, index) {
        final article = articles[index];

        return ListTile(
          onTap: () {
            onSelected(article);
          },
          leading: SizedBox(
              width: 100,
              child: article.imageURL == null
                  ? Image.asset(
                      "images/news-placeholder.png",
                      fit: BoxFit.cover,
                    )
                  : Image.network(
                      article.imageURL.toString(),
                      fit: BoxFit.cover,
                    )),
          title: Text(
            article.title.toString(),
          ),
        );
      },
    );
  }
}
