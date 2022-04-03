// @dart=2.9
import 'package:flutter/material.dart';
import 'package:sportify/services/auth.dart';
import '';
import '../../constants.dart';

class SignInEmail extends StatefulWidget {
  final Function toggleView;
  SignInEmail({ this.toggleView });

  @override
  _SignInEmailState createState() => _SignInEmailState();
}

class _SignInEmailState extends State<SignInEmail> {

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

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
                                  width: 2*MediaQuery.of(context).size.width/3-10,
                                  child: Text(
                                    'Hello there, welcome back',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 30,
                                      color: Colors.white,
                                      letterSpacing: 1.2,
                                      height: 1.4,
                                    ),

                                  ),

                                ),
                                Icon(
                                  Icons.coffee_sharp,
                                  size: 70,
                                  color: Colors.brown[900],
                                ),
                                // Container(
                                //   height: 100,
                                //   width: 100,
                                //   decoration: BoxDecoration(
                                //     borderRadius: BorderRadius.circular(15.0),
                                //     color: Colors.indigo,
                                //   ),
                                //   child: Center(
                                //     child: Icon(
                                //       Icons.ac_unit_outlined,
                                //       size: 30,
                                //       color: Colors.white,
                                //     ),
                                //   ),
                                // ),
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
                                      'LOGIN',
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
                            SizedBox(height: 12.0),
                            Center(
                              child: Text(
                                error,
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12,
                                    color: Colors.red,
                                    letterSpacing: 1.2
                                ),
                              ),
                            ),
                            Center(
                              child: TextButton(
                                onPressed: () => widget.toggleView(),
                                child: Text(
                                  'Don\'t have an account,Register!',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 18,
                                      color: Colors.brown[900],
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
                              ),
                            ),
                            SizedBox(height: 15.0),
                            // IconButton(
                            //   onPressed: () async{
                            //     dynamic result=_auth.googleSignIn();
                            //     if(result==null){
                            //       print('error signing in');
                            //     }
                            //     else{
                            //       print('signed in');
                            //       print(result.uid);
                            //     }
                            //   },
                            //   icon: Icon(
                            //     Icons.alternate_email_sharp,
                            //   ),
                            // )

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
