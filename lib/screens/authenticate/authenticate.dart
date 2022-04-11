// @dart=2.9



import 'package:flutter/material.dart';

import 'login.dart';
import 'register.dart';

class Authenticate extends StatefulWidget {
  const Authenticate({key}) : super(key: key);

  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {

  bool showSignIn = true;

  void toggleView(){
    //print(showSignIn.toString());
    setState(() => showSignIn = !showSignIn);
  }

  @override
  Widget build(BuildContext context) {
    if (showSignIn) {
      return Login(toggleView:  toggleView);
    } else {
      return Register(toggleView:  toggleView);
    }
  }
}

