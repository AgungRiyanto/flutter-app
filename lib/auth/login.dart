import 'package:flutter/material.dart';
import 'package:my_app/helpers/variables.dart' as variable;

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

    final title = Container(
      margin: EdgeInsets.only(top: 10, bottom: 30),
      alignment: Alignment.centerLeft,
      child: Text('Sign In', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
    );

    final emailField = Container(
      // color: Colors.white,
      padding: EdgeInsets.only(left: 10.0, right: 10.0),
      margin: EdgeInsets.only(bottom: 10.0),
       decoration: new BoxDecoration(
        color: Colors.white.withOpacity(0.7),
        border: Border.all(color: Colors.grey.withOpacity(0.5)),
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
      ),
      child: new TextField(
        style: new TextStyle(color: Colors.grey),
        decoration: new InputDecoration(
          hintText: 'Email..',
          hintStyle: TextStyle(color: Colors.grey),
          border: InputBorder.none,
          contentPadding: EdgeInsets.all(15.0),
          icon: Icon(Icons.mail_outline, color: Colors.grey)
        ),
      ),
    );

    final passwordField = Container(
      // color: Colors.white,
      padding: EdgeInsets.only(left: 10.0, right: 10.0),
      margin: EdgeInsets.only(bottom: 10.0),
       decoration: new BoxDecoration(
        color: Colors.white.withOpacity(0.7),
        border: Border.all(color: Colors.grey.withOpacity(0.5)),
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
      ),
      child: new TextField(
        style: new TextStyle(color: Colors.grey),
        decoration: new InputDecoration(
          hintText: 'Password..',
          hintStyle: TextStyle(color: Colors.grey),
          border: InputBorder.none,
          contentPadding: EdgeInsets.all(15.0),
          icon: Icon(Icons.lock_outline, color: Colors.grey)
        ),
      ),
    );

    final loginButton = Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text('Forgot Password ?', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey, decoration: TextDecoration.underline),),
          InkWell(
            onTap: () {
              Navigator.pushReplacementNamed(context, 'app');
            },
            child: Container(
              padding: EdgeInsets.all(15.0),
              margin: EdgeInsets.only(top: 10, bottom: 10),
              // width: 100  * width100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: variable.primary
              ),
              child: Icon(Icons.arrow_forward, color: Colors.white,),
            ),
          )
        ],
      ),
    );
    return MaterialApp(
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Color.fromRGBO(255, 2, 102, 1),
        body: SafeArea(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.,
            children: <Widget>[
              Expanded(
                flex: 4,
                child: Container(
                  color: Color.fromRGBO(255, 2, 102, 1),
                ),
              ),
              Expanded(
                flex: 6,
                child: Container(
                  width: 100 * width100,
                  padding: EdgeInsets.all(15.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0)),
                  ),
                  child: Column(
                    children: <Widget>[
                      title,
                      emailField,
                      passwordField,
                      loginButton
                    ],
                  ),
                ),
              )
            ],
          ),
        )
      ),
    );
  }
}