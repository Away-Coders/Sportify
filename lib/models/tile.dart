// @dart=2.9
// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:sportify/components/constants.dart';
import 'package:url_launcher/url_launcher.dart';

class Tile extends StatelessWidget {
  const Tile({key, this.urlToImage, this.title, this.url, this.content}) : super(key: key);
  final String urlToImage, title, url,content;


  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        SizedBox(height: MediaQuery.of(context).size.height * 0.077),
        Container( 
          //Image conatiner
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
        SizedBox(height: MediaQuery.of(context).size.height * 0.03),
        Title(title: title),
        SizedBox(height: MediaQuery.of(context).size.height * 0.03),
        Content(content: content),
        SizedBox(height: MediaQuery.of(context).size.height * 0.05),
        RaisedButton(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.1,vertical: MediaQuery.of(context).size.height*0.02),
            child: Text(
              'VIEW FULL STORY',
              style: Theme.of(context).textTheme.subtitle1.copyWith(color: kBackgroundDarkColor,fontWeight: FontWeight.bold)
            ),
          ),
          color: kPrimaryColor,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
          onPressed: () async {
            if (await canLaunch(url)) {
              await launch(url, forceWebView: true);
            } else {
              throw 'Could not launch $url';
            }
          }
      )
      ],
    ));
  }
}

class Title extends StatelessWidget {
  const Title({
    Key key,
    @required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(    
      child: Padding(
        padding: EdgeInsets.only(
        left: MediaQuery.of(context).size.width * 0.02,
        right:MediaQuery.of(context).size.width * 0.02,
        top: MediaQuery.of(context).size.height * 0.0,
        bottom: MediaQuery.of(context).size.height * 0.0
      ),
      child: Text(title,
          style: Theme.of(context)
              .textTheme
              .headline6
              .copyWith(fontSize: 21,color: Color.fromARGB(255, 244, 240, 240))
              ),
      ),
    );
  }
}

class Content extends StatelessWidget {
  const Content({
    Key key,
    @required this.content,
  }) : super(key: key);

  final String content;

  @override
  Widget build(BuildContext context) {
    return Container(
      
      
      child: Padding(
        padding: EdgeInsets.only(
        left: MediaQuery.of(context).size.width * 0.04,
        right:MediaQuery.of(context).size.width * 0.04,
        top: MediaQuery.of(context).size.height * 0.0,
        bottom: MediaQuery.of(context).size.height * 0.0
      ),
      child: Text(content,
          style: Theme.of(context)
              .textTheme
              .subtitle1
              .copyWith(color: Color.fromARGB(255, 175, 172, 172),fontSize: 17)
              ),
      ),
    );
  }
}
