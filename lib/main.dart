import 'package:flutter/material.dart';
import 'splash.dart';
// import 'login.dart';
import 'package:my_app/app/index.dart';
import 'package:my_app/auth/login.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: Login(),
      routes: <String, WidgetBuilder> {
        'splash': (context) => Splash(),
        'login': (context) => Login(),
        'app': (context) => App()
      },
    );
  }
}

void main() => runApp(MyApp());