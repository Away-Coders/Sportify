// @dart=2.9

import 'package:flutter/material.dart';
import 'package:sportify/constants.dart';
import 'package:sportify/gradient_text.dart';
import 'package:sportify/models/tile.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../helper/news.dart';
import '../models/article_model.dart';

class Tile extends StatelessWidget {
  const Tile({key, this.urlToImage, this.title, this.url})
      : super(key: key);
  final String urlToImage, title, url;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        Image.network(urlToImage),
        Text(
          title,
          style: TextStyle(
            fontSize: 25,
            color: kPrimaryColor
          ),
        ),
      ],
    ));
  }
}