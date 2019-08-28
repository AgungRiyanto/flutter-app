import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: <Widget>[
          Positioned(
            right: 20.0,
            bottom: 20.0,
            child: Container(
              padding: EdgeInsets.all(13),
              child: Icon(Icons.add, color: Colors.white,),
              decoration: BoxDecoration(
                color: Color.fromRGBO(255, 2, 102, 1),
                borderRadius: BorderRadius.all(Radius.circular(100))
              ),
            ),
          )
        ],
      ),
    );
  }
}