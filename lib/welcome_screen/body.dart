import 'package:flutter/material.dart';
import 'package:sportify/components/rounded_button.dart';
import 'package:sportify/constants.dart';
import 'package:sportify/screens/authenticate/signinemail.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../screens/authenticate/register_with_email.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // This size provide us total height and width of our screen
    return Column(
      // mainAxisAlignment: MainAxisAlignment.center,
      // crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text(
          "SPOTIFY",
          style: TextStyle(color: kPrimaryColor, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: size.height * 0.05),
        Container(
          height: size.height / 2,
          width: size.width / 2,
          child: const Image(
            image: AssetImage("assets/SportifyLogo.png"),
          ),
        ),
        SizedBox(height: size.height * 0.05),
        RoundedButton(
          text: "LOGIN",
          press: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return SignInEmail();
                },
              ),
            );
          },
        ),
        RoundedButton(
          text: "SIGN UP",
          textColor: Colors.black,
          press: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return RegisterWithEmail();
                },
              ),
            );
          },
        ),
      ],
    );
  }
}
