import 'package:flutter/material.dart';
import 'package:my_app/app/home/index.dart';

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
    Widget appBar() {
      return PreferredSize(
        preferredSize: Size(null, 100),
        child: Container(
          decoration: BoxDecoration(
            boxShadow: [BoxShadow(
              color: Colors.black12,
              spreadRadius: 5,
              blurRadius: 2
            )]
          ),
          width: MediaQuery.of(context).size.width,
          // height: 100,
          child: ClipRRect(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(0),
                bottomRight: Radius.circular(0)
            ),
            child: Container(
              padding: EdgeInsets.fromLTRB(15, 20, 15, 20),
              color: Color.fromRGBO(255, 2, 102, 1),
              child: Container(
                margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 4,
                      child: Text('Application', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        margin: EdgeInsets.only(left: 7),
                        child: Icon(Icons.add_comment, color: Colors.white),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        margin: EdgeInsets.only(left: 7),
                        child: Icon(Icons.search, color: Colors.white),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        margin: EdgeInsets.only(left: 7),
                        child: Icon(Icons.view_list, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    }

    final List<Widget>_body = [
      Home(),
      Home(),
      Home()
    ];

    return Scaffold(
      appBar: appBar(),
      body: _body[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
       onTap: onTabTapped,
       currentIndex: _currentIndex, // this will be set when a new tab is tapped
       items: [
         BottomNavigationBarItem(
           icon: new Icon(Icons.dashboard, color: _currentIndex == 0 ? Color.fromRGBO(255, 2, 102, 1):Colors.grey,),
           title: new Text(''),
         ),
         BottomNavigationBarItem(
           icon: new Icon(Icons.notifications, color: _currentIndex == 1 ? Color.fromRGBO(255, 2, 102, 1):Colors.grey),
           title: new Text(''),
         ),
         BottomNavigationBarItem(
           icon: Icon(Icons.person, color: _currentIndex == 2 ? Color.fromRGBO(255, 2, 102, 1):Colors.grey),
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