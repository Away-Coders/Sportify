// @dart=2.9

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sportify/screens/authenticate/authenticate.dart';
import 'package:sportify/screens/home/home_screen.dart';

import '../models/My_User.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final user=Provider.of<MyUser>(context);

    if(user==null){
      return Authenticate();
    }
    else {
      return HomeScreen();
    }
  }
}
