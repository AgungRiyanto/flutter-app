import 'package:flutter/material.dart';
import 'package:my_app/helpers/variables.dart' as variable;

import 'package:my_app/app/home/index.dart';
import 'package:my_app/app/profile/main.dart';

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
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    Widget appBar() {
      return PreferredSize(
        preferredSize: Size(null, 100),
        child: Padding(
           padding: new EdgeInsets.only(top: statusBarHeight),
          child: Container(
            width: MediaQuery.of(context).size.width,
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(0),
                  bottomRight: Radius.circular(0)
              ),
              child: Container(
                padding: EdgeInsets.all(15),
                color: Colors.white,
                child: Container(
                  margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 4,
                        child: Text('Application', style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold)),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          margin: EdgeInsets.only(left: 7),
                          child: Icon(Icons.add_comment, color: variable.primary),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          margin: EdgeInsets.only(left: 7),
                          child: Icon(Icons.search, color: variable.primary),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: InkWell(
                          splashColor: Theme.of(context).splashColor,
                          highlightColor: Theme.of(context).highlightColor,
                          onTap: () {
                          },
                          child: Container(
                            margin: EdgeInsets.only(left: 7),
                            child: Icon(Icons.add, color: variable.primary),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        )
      );
    }

    final List<Widget>_body = [
      Home(),
      Home(),
      Profile()
    ];

    return Scaffold(
      appBar: appBar(),
      body: _body[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: onTabTapped,
        currentIndex: _currentIndex, // this will be set when a new tab is tapped
        items: [
         BottomNavigationBarItem(
           icon: new Icon(Icons.dashboard, color: _currentIndex == 0 ? variable.primary:Colors.grey,),
          title: SizedBox.shrink(),
         ),
         BottomNavigationBarItem(
           icon: new Icon(Icons.rss_feed, color: _currentIndex == 1 ? variable.primary:Colors.grey),
          title: SizedBox.shrink(),
         ),
         BottomNavigationBarItem(
           icon: Icon(Icons.person_outline, color: _currentIndex == 2 ? variable.primary:Colors.grey),
          title: SizedBox.shrink()
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