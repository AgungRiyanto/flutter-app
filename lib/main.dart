import 'package:flutter/material.dart';
import 'splash.dart';
// import 'login.dart';
import 'package:my_app/app/index.dart';
import 'package:my_app/auth/login.dart';
import 'package:my_app/app/chats/room.dart';
import 'package:my_app/app/chats/chat-list.dart';
import 'package:my_app/app/creates/project.dart';
import 'package:my_app/app/home/project/main.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: Login(),
      theme: ThemeData(fontFamily: 'Be_Vietnam'),
      routes: <String, WidgetBuilder> {
        'splash': (context) => Splash(),
        'login': (context) => Login(),
        'app': (context) => App(),
        'chat-room': (context) => ChatRoom(),
        'chat-list': (context) => ChatList(),
        'create-project': (context) => CreateProject(),
        'project': (context) => Project()
      },
    );
  }
}

void main() => runApp(MyApp());