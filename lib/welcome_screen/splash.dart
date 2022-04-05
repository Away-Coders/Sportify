import 'package:flutter/material.dart';

import '../screens/wrapper.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    _navigatetowrapper();
  }

  _navigatetowrapper() async {
    await Future.delayed(Duration(milliseconds: 1500), () {});
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => Wrapper()));
  }

  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Scaffold(
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: size.width*0.1,vertical: size.height*0.05),
          child:ListView(
            children:[SizedBox(height: size.height * 0.3),
            Container(
              height: size.height / 5,
              width: size.width / 4,
              child: const Image(
                image: AssetImage("assets/SportifyLogo.png"),
              ),
            )
            ]
          )
        )
    );
  }
}
