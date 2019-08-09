import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  static String nav = 'login';
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final width100 = width/100;
    final height100 = height/100;

    final emailField = Container(
      // color: Colors.white,
      margin: EdgeInsets.only(bottom: 10.0),
       decoration: new BoxDecoration(
        color: Colors.white.withOpacity(0.7),
        border: Border.all(color: Colors.grey.withOpacity(0.2)),
        borderRadius: BorderRadius.all(Radius.circular(100.0)),
        
      ),
      child: new TextField(
        style: new TextStyle(color: Colors.grey),
        decoration: new InputDecoration(
          hintText: 'Email..',
          hintStyle: TextStyle(color: Colors.grey),
          border: InputBorder.none,
          contentPadding: EdgeInsets.all(15.0)
          
        ),
      ),
    );

    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color.fromRGBO(255, 2, 102, 1),
        body: SafeArea(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.,
            children: <Widget>[
              Expanded(
                flex: 3,
                child: Container(
                  color: Color.fromRGBO(255, 2, 102, 1),
                ),
              ),
              Expanded(
                flex: 7,
                child: Container(
                  width: 100 * width100,
                  padding: EdgeInsets.all(15.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0)),
                  ),
                  child: Center(
                    child: Column(
                      children: <Widget>[
                        emailField,
                        Text('ss')
                      ],
                    ),
                  )
                ),
              )
            ],
          ),
        )
      ),
    );
  }
}