// @dart=2.9

import 'package:flutter/material.dart';
import 'package:sportify/constants.dart';
import 'package:sportify/gradient_text.dart';
import 'package:sportify/models/tile.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../helper/news.dart';
import '../models/article_model.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<ArticleModel> articles = List<ArticleModel>();

  bool _loading = true;

  @override
  void initState() {
    super.initState();
    getNews();
  }

  getNews() async {
    News newsObj = News();
    await newsObj.getNews();
    articles = newsObj.news;
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: GradientText(
          'Discover',
          style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
          gradient:
              LinearGradient(colors: [Color(0xFF4568dc), Color(0xFFb06ab3)]),
        ),
      ),
      body: _loading
          ? Center(child: Container(child: CircularProgressIndicator()))
          : Container(
              child: PageView.builder(
                  itemCount: articles.length,
                  itemBuilder: (context, index) {
                    return Tile(
                        urlToImage: articles[index].urlToImage,
                        title: articles[index].title,
                        url: articles[index].url);
                  })),
    );
  }
}
