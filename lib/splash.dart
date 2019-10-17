import 'package:flutter/material.dart';
import 'dart:async';

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
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final width100 = width/100;
    final height100 = height/100;

    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(left: 15.0, right: 15.0),
      child: Center(
        child: Image.asset('assets/images/logo.png', width: width100 * 100.0,),
      )
    );
  }

  Future<Timer> navigate() async {
    return new Timer(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacementNamed('login');
    });
  }
}