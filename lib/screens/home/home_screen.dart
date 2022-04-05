// @dart=2.9

import 'package:flutter/material.dart';
import 'package:sportify/constants.dart';
import 'package:sportify/gradient_text.dart';
import 'package:sportify/models/tile.dart';
import 'package:sportify/services/auth.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../helper/news.dart';
import '../../models/article_model.dart';

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

  AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: GradientText(
      //     'SPORTIFY',
      //     style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
      //     gradient: LinearGradient(colors: [
      //       Color.fromARGB(255, 90, 105, 170),
      //       Color.fromARGB(255, 152, 226, 137)
      //     ]),
      //   ),
      //   actions: [
      //     IconButton(
      //       icon: Icon(
      //         Icons.logout,
      //         color: Colors.brown[900],
      //       ),
      //       onPressed: () async {
      //         return await _auth.signOut();
      //       },
      //     )
      //   ],
      // ),
      body: _loading
          ? Center(child: Container(child: CircularProgressIndicator()))
          : Container(
              constraints: BoxConstraints.expand(),
              // decoration: BoxDecoration(
              //     image: DecorationImage(
              //         colorFilter: ColorFilter.mode(
              //             Colors.black.withOpacity(0.1), BlendMode.dstATop),
              //         // image: NetworkImage(
              //         //     "https://previews.123rf.com/images/ms10/ms101605/ms10160500050/58020505-abstract-blue-vector-runner-running-man-vector-isolated-illustration-sport-athlete-run-decathlon.jpg"
              //         // ),
              //         image: AssetImage("assets/SportifyLogo.png"),
              //         fit: BoxFit.cover)),
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
