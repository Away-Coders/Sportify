// @dart=2.9

import 'package:flutter/material.dart';
import 'package:sportify/constants.dart';
import 'package:sportify/services/auth.dart';


class RegisterWithEmail extends StatefulWidget {
  final Function toggleView;
  RegisterWithEmail({ this.toggleView });

  @override
  _RegisterWithEmailState createState() => _RegisterWithEmailState();
}

class _RegisterWithEmailState extends State<RegisterWithEmail> {

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  // text field state
  String name='';
  String email = '';
  String password = '';

  String error = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: ListView(
        children: [
          Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                color: Colors.white,
              ),

              Positioned(
                  child: Container(
                      height: 5*MediaQuery.of(context).size.height/24,
                      width: MediaQuery.of(context).size.width,
                      color: Colors.brown[200],

                      child: ListView(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 28,left: 25),
                            child: Row(
                              children: [
                                Container(
                                  width: 2*MediaQuery.of(context).size.width/3-40,
                                  child: Text(
                                    'Get on      Board Now',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 30,
                                      color: Colors.white,
                                      letterSpacing: 1.2,
                                      height: 1.4,
                                    ),

                                  ),

                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 30),
                                  child: Icon(
                                    Icons.coffee_sharp,
                                    size: 70,
                                    color: Colors.brown[900],
                                  ),
                                ),
                              ],
                            ),
                          )

                        ],
                      )
                  )
              ),

              Positioned(
                  top: (5*MediaQuery.of(context).size.height/24)-20,
                  left: 10,
                  child: Container(
                    width: MediaQuery.of(context).size.width-20,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40),
                        bottomLeft: Radius.circular(40),
                        bottomRight: Radius.circular(40),
                      ),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.brown[900],
                            blurRadius: 5,
                            spreadRadius: 2
                        )
                      ],
                      color: Colors.white,

                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 30),
                            Text(
                              'Name',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 17,
                                  color: Colors.brown[500],
                                  letterSpacing: 1.2,
                                  shadows:[
                                    BoxShadow(
                                        color: Colors.indigo,
                                        blurRadius: 1,
                                        spreadRadius: 1
                                    )
                                  ]
                              ),
                            ),
                            SizedBox(height: 10),
                            TextFormField(
                              decoration: textInputDecoration,
                              validator: (val) => val.isEmpty ? 'Name shouldn\'t be null' : null,
                              onChanged: (val) {
                                setState(() => name = val);
                              },
                            ),
                            SizedBox(height: 20.0),
                            Text(
                              'Email',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 17,
                                  color: Colors.brown[500],
                                  letterSpacing: 1.2,
                                  shadows:[
                                    BoxShadow(
                                        color: Colors.indigo,
                                        blurRadius: 1,
                                        spreadRadius: 1
                                    )
                                  ]
                              ),
                            ),
                            SizedBox(height: 10),
                            TextFormField(
                              decoration: textInputDecoration,
                              validator: (val) => val.isEmpty ? 'Enter an email' : null,
                              onChanged: (val) {
                                setState(() => email = val);
                              },
                            ),
                            SizedBox(height: 20.0),
                            Text(
                              'Password',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 17,
                                  color: Colors.brown[500],
                                  letterSpacing: 1.2,
                                  shadows:[
                                    BoxShadow(
                                        color: Colors.indigo,
                                        blurRadius: 1,
                                        spreadRadius: 1
                                    )
                                  ]
                              ),
                            ),
                            SizedBox(height: 10.0),
                            TextFormField(
                              decoration: textInputDecoration,
                              validator: (val) => val.length < 6 ? 'Enter a password 6+ chars long' : null,
                              obscureText: true,
                              onChanged: (val) {
                                setState(() => password = val);
                              },
                            ),
                            SizedBox(height: 40.0),
                            Center(
                              child: RaisedButton(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 12,horizontal: 35),
                                    child: Text(
                                      'REGISTER',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  color: Colors.brown[900],
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
                            SizedBox(height: 8.0),
                            Text(
                              error,
                              style: TextStyle(color: Colors.red, fontSize: 14.0),
                            ),
                            Center(
                              child: Text(
                                'OR',
                                style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 19,
                                    color: Colors.brown[200],
                                    shadows:[
                                      BoxShadow(
                                          color: Colors.indigo,
                                          blurRadius: 1,
                                          spreadRadius: 1
                                      )
                                    ]
                                ),
                              ),
                            ),
                            SizedBox(height: 8),
                            Center(
                              child: TextButton(
                                onPressed: () => widget.toggleView(),
                                child: Text(
                                  'Login Now!',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 21,
                                      color: Colors.brown[900],
                                      shadows:[
                                        BoxShadow(
                                            color: Colors.indigo,
                                            blurRadius: 1,
                                            spreadRadius: 1
                                        )
                                      ]
                                  ),
                                ),
                              ),
                            ),

                          ],
                        ),
                      ),
                    ),
                  )
              )

            ],
          )
        ],
      ),
    );
  }
}
