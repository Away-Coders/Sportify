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
