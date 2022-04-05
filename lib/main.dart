import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:sportify/login/login.dart';
import 'package:sportify/models/My_User.dart';
import 'package:sportify/screens/home/Demo.dart';
import 'package:sportify/screens/home/home_screen.dart';
import 'package:sportify/screens/wrapper.dart';
import 'package:sportify/services/auth.dart';
import 'package:sportify/theme.dart';
import 'package:sportify/welcome_screen/splash.dart';
import 'register/register.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyUser user1 = MyUser();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<MyUser>.value(
      initialData: user1,
      value: AuthService().stuser,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Analog Clock',
        theme: themeData(context),
        darkTheme: darkThemeData(context),
        themeMode: ThemeMode.dark,
        home: Splash(),
      ),
    );
  }
}
