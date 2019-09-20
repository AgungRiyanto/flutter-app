import 'package:flutter/material.dart';
import 'package:my_app/helpers/variables.dart' as variable;
import 'package:my_app/models/chat_list.dart';

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
        padding: EdgeInsets.only(right: 10, left: 10, top: 15, bottom: 15),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Container(
                    alignment: Alignment.bottomLeft,
                    child: Icon(Icons.arrow_back_ios, color: variable.primary),
                  ),
                ),
                Expanded(
                  flex: 8,
                  child: Container(
                    alignment: Alignment.center,
                    child: Text('Chats', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: variable.primary)),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    alignment: Alignment.bottomRight,
                    child: Icon(Icons.search, color: variable.primary),
                  ),
                )
              ],
            ),
          ],
        ),
      );
    }

    Widget content() {
      return Expanded(
        flex: 10,
        child: Container(
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
        ),
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
                content(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}