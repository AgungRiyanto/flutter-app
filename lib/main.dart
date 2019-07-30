import 'package:flutter/material.dart';
import 'login.dart';
import 'home.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: Login(),
      routes: <String, WidgetBuilder> {
        Login.nav: (context) => Login(),
        TabbedAppBarSample.nav: (context) => TabbedAppBarSample()
      },
    );
  }
}

void main() => runApp(MyApp());