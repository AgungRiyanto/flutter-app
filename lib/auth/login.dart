import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';
import 'dart:convert';
import 'package:my_app/helpers/variables.dart' as variable;
import 'package:http/http.dart' as http;
import 'package:my_app/firebase/authentication.dart';
var baseUrl = 'http://admin.eticketing.marlinbooking.co.id/';

class Login extends StatefulWidget {
  Login({ this.auth, this.onSignedIn });
  final BaseAuth auth;
  final VoidCallback onSignedIn;

	@override
	_LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
	
	final emailController = TextEditingController(text: 'loketoceanna@mail.com');
	final passwordController = TextEditingController(text: 'password');

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

	@override
	void disposed() {
		emailController.dispose();
		passwordController.dispose();
		super.dispose();
	}
  
	@override
	Widget build(BuildContext context) {
		final width = MediaQuery.of(context).size.width;
		final height = MediaQuery.of(context).size.height;
		final width100 = width/100;
		final height100 = height/100;

		final title = Container(
			margin: EdgeInsets.only(top: 10, bottom: 30),
			alignment: Alignment.centerLeft,
			child: Text('Sign In', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
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
				controller: emailController,
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
				controller: passwordController,
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
					Text('Forgot Password ?', style: TextStyle(color: Colors.grey),),
					InkWell(
						onTap: () async {
              String userId = "";
              // userId =await widget.auth.signUp(email, password)
               widget.auth.signUp(emailController.text, passwordController.text)
               .then((userId) {
                 print('succes ::::::'+ userId);
                // setState(() {
                // authStatus = userId == null ? AuthStatus.notSignedIn : AuthStatus.signedIn;
                // });
              }).catchError((onError){
                print('');
                // authStatus = AuthStatus.notSignedIn;
              });
              // final JsonDecoder json = new JsonDecoder();
							// var client = new http.Client();
							// try {
							// 	var uriResponse = await client.post('http://admin.eticketing.marlinbooking.co.id/api/v1/auth/signin',
							// 			body: {
							// 				'email': emailController.text,
							// 				'password': passwordController.text
							// 			});
              //       var response = json.convert(uriResponse.body);
							// 			if (uriResponse.statusCode == 200) {
              //         SharedPreferences prefs = await SharedPreferences.getInstance();
              //         prefs.setString('name', response['payload']['name']);
							// 				Navigator.of(context).pushNamed('app');
							// 			} else {
							// 				print('error dong');
							// 			}
							// } finally {
							// 	client.close();
							// }
						},
						child: Container(
							padding: EdgeInsets.all(15.0),
							margin: EdgeInsets.only(top: 10, bottom: 10),
							// width: 100  * width100,
							decoration: BoxDecoration(
								borderRadius: BorderRadius.circular(100),
								color: variable.primary
							),
							child: Row(
                children: <Widget>[
                  Icon(Icons.arrow_forward, color: Colors.white,),
                ],
              )
						),
					)
				],
			),
		);
		return MaterialApp(
      theme: ThemeData(fontFamily: 'Be_Vietnam'),
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