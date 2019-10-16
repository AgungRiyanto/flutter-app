import 'package:flutter/material.dart';
import 'package:my_app/helpers/variables.dart' as variable;
import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
import 'package:my_app/app/home/index.dart';
import 'package:my_app/app/profile/main.dart';
import 'add_dialog.dart';

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
                        child: Text('Managing', style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold)),
                      ),
                      Expanded(
                        flex: 1,
                        child: InkWell(
                          splashColor: Theme.of(context).splashColor,
                          highlightColor: Theme.of(context).highlightColor,
                          onTap: () {
                            Navigator.pushNamed(context, 'chat-list');
                          },
                          child: Container(
                            margin: EdgeInsets.only(left: 7),
                            child: Icon(Icons.add_comment, color: variable.primary),
                          ),
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
                            Navigator.pushNamed(context, 'create-project');
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
      bottomNavigationBar: BubbleBottomBar(
        opacity: .2,
        currentIndex: _currentIndex,
        onTap: onTabTapped,
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
        elevation: 8,
        // fabLocation: BubbleBottomBarFabLocation.end, //new
        hasNotch: true, //new
        hasInk: true, //new, gives a cute ink effect
        inkColor: Colors.black12, //optional, uses theme color if not specified
        items: <BubbleBottomBarItem>[
            BubbleBottomBarItem(backgroundColor: variable.primary, icon: Icon(Icons.dashboard, color: Colors.grey,), activeIcon: Icon(Icons.dashboard, color: variable.primary,), title: Text("Home")),
            BubbleBottomBarItem(backgroundColor: variable.primary, icon: Icon(Icons.notifications_active, color: Colors.grey,), activeIcon: Icon(Icons.notifications_active, color: variable.primary,), title: Text("Notification")),
            BubbleBottomBarItem(backgroundColor: variable.primary, icon: Icon(Icons.person_outline, color: Colors.grey,), activeIcon: Icon(Icons.person_outline, color: variable.primary,), title: Text("Profile")),
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