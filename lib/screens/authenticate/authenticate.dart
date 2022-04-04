
import 'package:flutter/material.dart';
import 'package:sportify/screens/authenticate/register_with_email.dart';
import 'package:sportify/screens/authenticate/signinemail.dart';

import '../../login/login.dart';

class Authenticate extends StatefulWidget {
  const Authenticate({Key? key}) : super(key: key);

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
      return RegisterWithEmail(toggleView:  toggleView);
    }
  }
}

