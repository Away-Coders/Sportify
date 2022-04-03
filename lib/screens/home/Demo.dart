// @dart=2.9

import 'package:flutter/material.dart';
import 'package:sportify/constants.dart';
import 'package:sportify/gradient_text.dart';
import 'package:sportify/models/tile.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../helper/news.dart';
import '../../models/article_model.dart';

class Demo extends StatelessWidget {
  const Demo({ key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: GradientText(
          'FLutter ',
          style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
          gradient:
              LinearGradient(colors: [Color(0xFF4568dc), Color(0xFFb06ab3)]),
        ),
      ),
      body: Container(
        height:MediaQuery.of(context).size.height,
        width:MediaQuery.of(context).size.width, 
        color:Colors.green,
      )
    );
  }
}