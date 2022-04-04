// @dart=2.9
import 'package:flutter/material.dart';
import 'package:sportify/constants.dart';
import 'package:sportify/services/auth.dart';

class Register extends StatefulWidget {
  final Function toggleView;
  Register({ this.toggleView });

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  // text field state
  String name='';
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
            // Container(
            //   height: size.height / 5,
            //   width: size.width / 4,
            //   child: const Image(
            //     image: AssetImage("assets/SportifyLogo.png"),
            //   ),
            // ),
            SizedBox(height: size.height * 0.05),
            Text(
              'Create Account',
              style: Theme.of(context).textTheme.headline4.copyWith(color: Colors.white,fontSize: 30,fontWeight: FontWeight.bold)
            ),
            SizedBox(height: size.height * 0.015),
            Text(
              'Please fill the input below',
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
                    decoration: textInputDecoration.copyWith(hintText: "FULL NAME"),
                    validator: (val) => val.isEmpty ? 'Name shouldn\'t be null' : null,
                    onChanged: (val) {
                      setState(() => name = val);
                    },
                  ),
                  SizedBox(height: size.height * 0.03),
                  TextFormField(
                    decoration: textInputDecoration.copyWith(hintText: "EMAIL"),
                    validator: (val) => val.isEmpty ? 'Enter an email' : null,
                    onChanged: (val) {
                      setState(() => email = val);
                    },
                  ),
                  SizedBox(height: size.height * 0.03),
                  TextFormField(
                    decoration: textInputDecoration.copyWith(hintText:"PASSWORD"),
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
                            'REGISTER',
                            style: Theme.of(context).textTheme.headline6.copyWith(color: kBackgroundDarkColor,fontWeight: FontWeight.bold)
                          ),
                        ),
                        color: kPrimaryColor,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
                        onPressed: () async {
                          if(_formKey.currentState.validate()){
                            dynamic result=_auth.registerWithEmailAndPassword(email, password);
                            if(result==null){
                              setState(() {
                                error = 'Please supply a valid email';
                              });
                            }
                          }
                        }
                    ),
                  ),
                ],
              )
            ),
            // SizedBox(height: size.height * 0.04),
            // Text(
            //   error,
            //   style: TextStyle(color: Colors.red, fontSize: 14.0),
            // ),
            SizedBox(height: size.height * 0.065),
            Row(
              mainAxisAlignment:MainAxisAlignment.center,
              children: [
                Text(
                  'Already have an account?',
                  style: Theme.of(context).textTheme.bodyText1.copyWith(letterSpacing:1.1,fontSize:15)
                ),
                TextButton(
                  onPressed: () => widget.toggleView(),
                  child: Text(
                    'Sign in',
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