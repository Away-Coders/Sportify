
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/My_User.dart';
import 'authenticate/authenticate.dart';
import 'home/Demo.dart';
import 'home/home_screen.dart';

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