// @dart=2.9

// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:sportify/components/constants.dart';

class Tile extends StatelessWidget {
  const Tile({key, this.urlToImage, this.title, this.url}) : super(key: key);
  final String urlToImage, title, url;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        SizedBox(height: MediaQuery.of(context).size.height * 0.077),
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.4,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(0.0),
                  bottomRight: Radius.circular(10.0),
                  topLeft: Radius.circular(0.0),
                  bottomLeft: Radius.circular(10.0)),
            image: DecorationImage(
              fit: BoxFit.fill,
              image: NetworkImage(urlToImage),
            ),
          ),
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.04),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.03,vertical:0),
          child: Container(
            decoration: const BoxDecoration(
              color: Color(0xFF23252E),
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(40.0),
                  bottomRight: Radius.circular(40.0),
                  topLeft: Radius.circular(40.0),
                  bottomLeft: Radius.circular(40.0)),
            ),
            height: MediaQuery.of(context).size.height * 0.2,
            // width: MediaQuery.of(context).size.width * 0.
            
            padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * 0.03,
                right:MediaQuery.of(context).size.width * 0.03,
                top: MediaQuery.of(context).size.height * 0.00,
                bottom: MediaQuery.of(context).size.height * 0.00),
            child: Center(
              child: Text(title,
                  style: Theme.of(context)
                      .textTheme
                      .headline6
                      .copyWith(color: Color.fromARGB(255, 175, 172, 172))),
            ),
          ),
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.06),
        RaisedButton(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.1,vertical: MediaQuery.of(context).size.height*0.02),
            child: Text(
              'VIEW FULL STORY',
              style: Theme.of(context).textTheme.headline6.copyWith(color: kBackgroundDarkColor,fontWeight: FontWeight.bold)
            ),
          ),
          color: kPrimaryColor,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
          onPressed: () async {
          }
      )
      ],
    ));
  }
}
