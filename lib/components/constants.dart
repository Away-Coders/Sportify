import 'package:flutter/material.dart';

// Colors
const kPrimaryColor = Color(0xFF0DF5E3);
const kSecondaryLightColor = Color(0xFFE4E9F2);
const kSecondaryDarkColor = Color(0xFF23252E);
const kAccentLightColor = Color(0xFFB3BFD7);
const kAccentDarkColor = Color(0xFF4E4E4E);
const kBackgroundDarkColor = Color(0xFF171A1F);
const kSurfaceDarkColor = Color(0xFF222225);
// Icon Colors
const kAccentIconLightColor = Color(0xFFECEFF5);
const kAccentIconDarkColor = Color(0xFF303030);
const kPrimaryIconLightColor = Color(0xFFECEFF5);
const kPrimaryIconDarkColor = Color(0xFF232323);
// Text Colors
const kBodyTextColorLight = Color(0xFFA1B0CA);
const kBodyTextColorDark = Color(0xFF8B8B8D);
const kTitleTextLightColor = Color(0xFF101112);
const kTitleTextDarkColor = Colors.white;

const kShadowColor = Color(0xFF364564);

const textInputDecoration = InputDecoration(
  // fillColor: Colors.white,
  // filled: true,
  contentPadding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
  hintStyle: TextStyle(fontSize: 15),
  enabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: kPrimaryColor, width: 2.0)),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: kPrimaryColor, width: 2.0),
    borderRadius: BorderRadius.all(
      Radius.circular(10.0),
    ),
  ),
);
