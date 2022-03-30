// @dart=2.9

import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../gradient_text.dart';

class ArticleView extends StatefulWidget {
  final String blogUrl;
  const ArticleView({key, this.blogUrl}) : super(key: key);

  @override
  State<ArticleView> createState() => _ArticleViewState();
}

class _ArticleViewState extends State<ArticleView> {
  final Completer<WebViewController> _completer =
      Completer<WebViewController>();
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
      body: Container(
        child: WebView(
          initialUrl: widget.blogUrl,
          onWebViewCreated: ((WebViewController webViewController) {
            _completer.complete(webViewController);
          }),
        )
      )
    );
  }
}
