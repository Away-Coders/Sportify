// @dart=2.9

import 'package:flutter/material.dart';
import 'package:sportify/constants.dart';
import 'package:sportify/gradient_text.dart';

class HomeScreen extends StatelessWidget {
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
    );
  }
}

class Tile extends StatelessWidget {
  const Tile({key, this.imageUrl, this.title, this.desc}) : super(key: key);
  final String imageUrl, title, desc;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [Image.network(imageUrl), Text(title), Text(desc)],
    ));
  }
}
