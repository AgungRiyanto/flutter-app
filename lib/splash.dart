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
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final width100 = width/100;
    final height100 = height/100;

    return Container(
      color: Color.fromRGBO(46, 50, 132, 1),
      padding: EdgeInsets.only(left: 15.0, right: 15.0),
      child: Center(
        child: Image.asset('assets/logo-mb.png', width: width100 * 70.0,),
      )
    );
  }

  Future<Timer> navigate() async {
    return new Timer(Duration(seconds: 2), () {
      // Na
    });
  }
}