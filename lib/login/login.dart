// @dart=2.9

// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sportify/constants.dart';

import '../services/auth.dart';

class Login extends StatefulWidget {

  final Function toggleView;
  Login({ this.toggleView });


  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  String email = '';
  String password = '';

  String error = '';


  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: size.width*0.1,vertical: size.height*0.05),
        child: ListView(
          children: [
            SizedBox(height: size.height * 0.03),
            Container(
              height: size.height / 5,
              width: size.width / 4,
              child: const Image(
                image: AssetImage("assets/SportifyLogo.png"),
              ),
            ),
            SizedBox(height: size.height * 0.05),
            Text(
              'Login',
              style: Theme.of(context).textTheme.headline4.copyWith(color: Colors.white,fontSize: 30,fontWeight: FontWeight.bold)
            ),
            SizedBox(height: size.height * 0.015),
            Text(
              'Please sign in to continue',
              style: Theme.of(context).textTheme.bodyText1.copyWith(letterSpacing:1.1,fontSize:15)
            ),
            SizedBox(height: size.height * 0.04),
            Form(
              key:_formKey,
              child:Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Icon(
                  //   FontAwesomeIcons.envelope,
                  //   size: 24
                  // ),
                  // SizedBox(height: size.height * 0.005),
                  TextFormField(
                    decoration: textInputDecoration.copyWith(hintText: "EMAIL",),
                    validator: (val) => val.isEmpty ? 'Enter an email' : null,
                    onChanged: (val) {
                      setState(() => email = val);
                    },
                  ),
                  SizedBox(height: size.height * 0.03),
                  TextFormField(
                    decoration: textInputDecoration.copyWith(hintText: "PASSWORD",),
                    validator: (val) => val.length < 6 ? 'Enter a password 6+ chars long' : null,
                    obscureText: true,
                    onChanged: (val) {
                      setState(() => password = val);
                    },
                  ),
                  SizedBox(height: size.height * 0.04),
                  Center(
                    child: RaisedButton(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: size.width*0.1,vertical: size.height*0.02),
                          child: Text(
                            'LOGIN',
                            style: Theme.of(context).textTheme.headline6.copyWith(color: kBackgroundDarkColor,fontWeight: FontWeight.bold)
                          ),
                        ),
                        color: kPrimaryColor,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
                        onPressed: () async {
                            if(_formKey.currentState.validate()){
                              dynamic result = await _auth.signInWithEmailAndPassword(email, password);
                              if(result==null){
                                setState(() {
                                  error = 'COULD NOT SIGN IN WITH THOSE CREDENTIALS';
                                });
                              }
                            }
                        }
                    ),
                  ),
                ],
              )
            ),
            SizedBox(height: size.height * 0.065),
            Row(
              mainAxisAlignment:MainAxisAlignment.center,
              children: [
                Text(
                  'Don\'t have an account?',
                  style: Theme.of(context).textTheme.bodyText1.copyWith(letterSpacing:1.1,fontSize:15)
                ),
                TextButton(
                  onPressed: () => widget.toggleView(),
                  child: Text(
                    'Sign Up',
                    style: Theme.of(context).textTheme.bodyText1.copyWith(fontSize:16,color:kPrimaryColor,fontWeight: FontWeight.bold)
                  ),
                )
              ]
            )
          ]

        ),
      )
    );
  }
}
