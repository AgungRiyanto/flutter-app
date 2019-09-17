import 'package:flutter/material.dart';
import 'package:my_app/helpers/variables.dart' as variable;
import 'package:my_app/models.dart';

class ChatList extends StatefulWidget {
  _ChatListState createState() => _ChatListState();
}

class  _ChatListState extends State<ChatList> {
  final chatLists = <ChatListModel>[
    ChatListModel(
      sender: 'John Doe',
      last_msg: 'helo gaess',
      avatar: 'assets/johndoe.jpg'
    ),
    ChatListModel(
      sender: 'Jane doe',
      last_msg: 'helo gaess',
      avatar: 'assets/johndoe.jpg'
    ),
    ChatListModel(
      sender: 'Steve Jobs',
      last_msg: 'eehelo gaess',
      avatar: 'assets/johndoe.jpg'
    ),
    ChatListModel(
      sender: 'Linus',
      last_msg: 'helo gaess',
      avatar: 'assets/johndoe.jpg'
    )
  ];

  @override
  Widget build(BuildContext context) {
    Widget appBar() {
      return Container(
        color: Colors.white,
        padding: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  flex: 8,
                  child: Container(
                    child: Text('Chats', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: variable.primary)),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    alignment: Alignment.bottomRight,
                    child: Icon(Icons.more_vert, color: variable.primary),
                  ),
                )
              ],
            ),
            // Container(
            //   margin: EdgeInsets.only(top: 10),
            //   padding: EdgeInsets.all(10),
            //   width: MediaQuery.of(context).size.width,
            //   decoration: BoxDecoration(
            //     borderRadius: BorderRadius.all(Radius.circular(3)),
            //     color: Colors.grey.withOpacity(0.2)
            //   ),
            //   child: Row(
            //     children: <Widget>[
            //       Expanded(
            //         flex: 1,
            //         child: Icon(Icons.search, color: Colors.white,),
            //       ),
            //       Expanded(
            //         flex: 9,
            //         child: TextField(
                      
            //         ),
            //       )
            //     ],
            //   ),
            // )
          ],
        ),
      );
    }

    Widget content() {
      return Container(
        height: 400,
        child: ListView.builder(
          itemBuilder: (context, i) {
            return Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.all(10),
              child: Row(
                children: <Widget>[
                  Container(
                    width: 50,
                    height: 50,
                    decoration: new BoxDecoration(
                        shape: BoxShape.circle,
                        image: new DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(chatLists[i].avatar)
                        )
                    )
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    padding: EdgeInsets.only(left: 10),
                    child: Column(
                      children: <Widget>[
                        Text(chatLists[i].sender, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
                        Text(chatLists[i].last_msg, style: TextStyle(color: Colors.grey, fontSize: 14),)
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
          itemCount: chatLists.length,
        )
      );
    } 

    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Container(
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                appBar(),
                content()
              ],
            ),
          ),
        ),
      ),
    );
  }
}