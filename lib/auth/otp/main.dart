import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginOTP extends StatefulWidget {
  @override
  _LoginOTPState  createState() => _LoginOTPState();
}

class _LoginOTPState extends State<LoginOTP> {
    String phoneNumber;
    String smsCode;
    String verificationCode;
    String uid;

  @override
  void initState() { 
    super.initState();
    FirebaseAuth.instance.currentUser().then((user) {
      this.uid = user.uid;
    });
  }
    

  Future<void> _submit() async {
    final PhoneCodeAutoRetrievalTimeout autoRetrievalTimeout = (String verId) {
      this.verificationCode = verId;
    };

    final PhoneCodeSent phoneCodeSent = (String verId, [int forceCodeResend]) {
      this.verificationCode = verId;
      smsCodeDialog(context).then((value) => print("Signed In"));
    };

    final PhoneVerificationCompleted phoneVerificationCompleted = (
        AuthCredential user) {
      print("Success" + user.toString());
    };

    final PhoneVerificationFailed phoneVerificationFailed = (
        AuthException exception) {
      print("${exception.message}");
    };

    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: this.phoneNumber,
        timeout: const Duration(seconds: 5),
        verificationCompleted: phoneVerificationCompleted,
        verificationFailed: phoneVerificationFailed,
        codeSent: phoneCodeSent,
        codeAutoRetrievalTimeout: autoRetrievalTimeout
    );
  }

  Future<bool> smsCodeDialog(BuildContext context) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Enter Code" + uid),
          content: TextField(
            onChanged: (value) {
              this.smsCode = value;
            },
          ),
          contentPadding: EdgeInsets.all(10.0),
          actions: <Widget>[
            FlatButton(
              child: Text("Verify"),
              onPressed: (){
                FirebaseAuth.instance.currentUser().then((user) {
                  if(user != null) {
                    print('print not nul');
                    // Navigator.of(context).pop();
                    // Navigator.of(context).pushReplacementNamed('/homepage');
                    // _testSignInWithPhoneNumber(smsCode);
                  } else {
                    print('print null');

                    Navigator.of(context).pop();
                    _testSignInWithPhoneNumber(smsCode);
                  }
                });
              },
            )
          ],
        );
      }
    );
  }

  Future<String> _testSignInWithPhoneNumber(String smsCode) async {
    final AuthCredential credential = PhoneAuthProvider.getCredential(
      verificationId: verificationCode,
      smsCode: smsCode,
    );
    final AuthResult user = await FirebaseAuth.instance.signInWithCredential(credential);
    // final AuthResult currentUser = await FirebaseAuth.instance.currentUser();
    // assert(user.uid == currentUser.uid);

    // _smsCodeController.text = '';
    return 'signInWithPhoneNumber succeeded: $user';
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Be_Vietnam'),
			home: Scaffold(
				resizeToAvoidBottomInset: false,
				backgroundColor: Color.fromRGBO(255, 2, 102, 1),
				body: SafeArea(
				child: Column(
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.phone),
              title: TextField(
                decoration: InputDecoration(
                    labelText: "Phone Number"
                ),
                keyboardType: TextInputType.phone,
                onChanged: (value) => phoneNumber = value,
              ),
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0),
                    child: RaisedButton(
                      onPressed: _submit,
                      child: Text("Submit", style: TextStyle(fontSize: 15.0, color: Colors.white),),
                      color: Color(0xFF18D191),
                      elevation: 7.0,
                    ),
                  ),
                ),
              ],
            )
          ],
        )
				)
			),
		);;
  }
}