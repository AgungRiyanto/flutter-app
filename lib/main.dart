import 'package:flutter/material.dart';
import 'splash.dart';
import 'login.dart';
import 'app.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: Splash(),
      routes: <String, WidgetBuilder> {
        Splash.nav: (context) => Splash(),
        Login.nav: (context) => Login(),
        App.nav: (context) => App()
      },
    );
  }
}

void main() => runApp(MyApp());