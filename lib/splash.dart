import 'package:flutter/material.dart';
import 'dart:async';
import 'login.dart';

class Splash extends StatefulWidget {
  static String nav = 'splash';

  State<StatefulWidget> createState() {
    return _SplashState();
  }

  
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    
    navigate();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: Image.asset('assets/flutterlogo.png'),
      )
    );
  }

  Future<Timer> navigate() async {
    return new Timer(Duration(seconds: 2), () {
      Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
    });
  }
}