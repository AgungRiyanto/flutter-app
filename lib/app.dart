import 'package:flutter/material.dart';
import 'home.dart';

class App extends StatefulWidget {
  static String nav = 'app';
  @override
  State<StatefulWidget> createState() {
    return _AppState();
  }
}

class _AppState extends State<App> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final List<Widget>_body = [
      Home(),
      Home(),
      Home()
    ];

    return Scaffold(
      appBar: AppBar(
       title: Text('My Flutter App'),
     ),
     body: _body[_currentIndex],
     bottomNavigationBar: BottomNavigationBar(
       onTap: onTabTapped,
       currentIndex: _currentIndex, // this will be set when a new tab is tapped
       items: [
         BottomNavigationBarItem(
           icon: new Icon(Icons.home),
           title: new Text(''),
         ),
         BottomNavigationBarItem(
           icon: new Icon(Icons.mail),
           title: new Text(''),
         ),
         BottomNavigationBarItem(
           icon: Icon(Icons.person),
           title: Text('')
         )
       ],
     ),
    );
  }

  void onTabTapped(int index) {
   setState(() {
     _currentIndex = index;
   });
  }
}