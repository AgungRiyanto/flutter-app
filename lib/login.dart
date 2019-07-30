import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'home.dart';

class Login extends StatefulWidget {
  static String nav = 'login';
  @override
  _LoginState createState() => new _LoginState();
}

class _LoginState extends State<Login> {
  @override
  void initState() { 
    super.initState();
    
  }

  String email = 'agungreyanto@yandex.com';
  String password = 'password';

  @override
  Widget build(BuildContext context) {
    final logo = Image.asset('assets/ig.png', width: 80.0, color: Colors.white);

    final emailField = Container(
      // color: Colors.white,
      margin: EdgeInsets.only(bottom: 10.0),
       decoration: new BoxDecoration(
        color: Colors.white.withOpacity(0.7),
        borderRadius: BorderRadius.all(new Radius.circular(3.0)),
      ),
      child: new TextField(
        onChanged: (text) {
          setState(() {
            email = text;
          });
        },
        style: new TextStyle(color: Colors.white),
        decoration: new InputDecoration(
          hintText: 'Email..',
          hintStyle: TextStyle(color: Colors.white),
          border: InputBorder.none,
          contentPadding: EdgeInsets.all(15.0)
        ),
      ),
    );

    final passwordField = Container(
      // color: Colors.white,
      margin: EdgeInsets.only(bottom: 10.0),
       decoration: new BoxDecoration(
        color: Colors.white.withOpacity(0.7),
        borderRadius: BorderRadius.all(new Radius.circular(3.0)),
      ),
      child: new TextField(
        onChanged: (text) {
          setState(() {
            password = text;
          });
        },
        obscureText: true,
        style: new TextStyle(color: Colors.white),
        decoration: new InputDecoration(
          hintText: 'Password..',
          hintStyle: TextStyle(color: Colors.white),
          border: InputBorder.none,
          contentPadding: EdgeInsets.all(15.0),
        ),
      ),
    );

    final buttonLogin = Container(
      margin: EdgeInsets.only(top: 10.0),
      child: OutlineButton(
        color: Colors.transparent,
        onPressed: () async {
          http.post('https://marlinbooking.co.id/api/v1/login',
            body: {
              'email': email,
              'password': password
            }).then((http.Response response){
              final statusCode = response.statusCode;
              if (statusCode == 200) {
                Navigator.of(context).pushNamed(TabbedAppBarSample.nav);
              } else {
                Fluttertoast.showToast(
                  msg: "Error",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.CENTER,
                  timeInSecForIos: 1,
                  backgroundColor: Colors.red,
                  textColor: Colors.white,
                  fontSize: 16.0
                );
              }
            });
        },
        padding: EdgeInsets.all(15.0),
        child: Text('Log in', style: TextStyle(
          color: Colors.white.withOpacity(0.7), 
          fontWeight: FontWeight.bold)
        ),
        borderSide: BorderSide(
          color: Colors.white.withOpacity(0.7),
          width: 1
        ),

      )
    );

    Widget content() {
      return Container(
        margin: EdgeInsets.only(top: 20.0),
        child: Column(
          children: <Widget>[
            emailField,
            passwordField
          ],
        ),
      );
    }

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          stops: [0.1, 0.4, 0.7, 0.9],
          colors: [
            Colors.purple[700],
            Colors.red[600],
            Colors.purple[500],
            Colors.purple[400]

          ],
        )
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: ListView(
            shrinkWrap: true,
            padding: EdgeInsets.only(left: 20.0, right: 20.0),
            children: <Widget>[
              logo,
              content(),
              buttonLogin
            ],
          )
        ),
      ),
    );
  }
}