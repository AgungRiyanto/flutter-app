import 'package:flutter/material.dart';
import 'package:my_app/helpers/variables.dart' as variable;
import 'package:my_app/models.dart';

class ChatRoom extends StatefulWidget {
  String nav = 'chat-room';
  _ChatRoomState createState() => _ChatRoomState();
}

class _ChatRoomState extends State<ChatRoom> {
  final messages = <Message>[
    Message(
      text: 'hello',
      time: '10:00',
      msg_type: 'receive'
    ),
    Message(
      text: 'hello1',
      time: '10:00',
      msg_type: 'send'
    ),
    Message(
      text: 'hello2',
      time: '10:00',
      msg_type: 'receive'
    ),
    Message(
      text: 'hello2',
      time: '10:00',
      msg_type: 'send'
    ),
    Message(
      text: 'hello2',
      time: '10:00',
      msg_type: 'send'
    ),
    Message(
      text: 'hello2',
      time: '10:00',
      msg_type: 'send'
    ),
    Message(
      text: 'hello2',
      time: '10:00',
      msg_type: 'send'
    ),
    Message(
      text: 'hello2',
      time: '10:00',
      msg_type: 'send'
    ),
    Message(
      text: 'hello2',
      time: '10:00',
      msg_type: 'send'
    ),
     Message(
      text: 'hello2',
      time: '10:00',
      msg_type: 'send'
    ),
     Message(
      text: 'hello2',
      time: '10:00',
      msg_type: 'send'
    ),
     Message(
      text: 'hello2',
      time: '10:00',
      msg_type: 'send'
    )
  ];

  @override
  Widget build(BuildContext context) {

    Widget appBar() {
      return Container(
        padding: EdgeInsets.all(10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              flex: 2,
              child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: Icon(Icons.arrow_back_ios, color: variable.primary),
                ),
              ),
            ),
            Expanded(
              flex: 8,
              child: Container(
                alignment: Alignment.center,
                child: Column(
                  children: <Widget>[
                    CircleAvatar(
                      radius: 20.0,
                      backgroundImage: AssetImage('assets/johndoe.jpg'),
                    ),
                    Text('John Doe', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey))
                  ],
                )
              ),
            ),
            Expanded(
              flex: 2,
                child: InkWell(
                  child: Container(
                    alignment: Alignment.centerRight,
                    child: Icon(Icons.more_vert, color: variable.primary),
                  ),
                ),
            ),
          ],
        ),
      );
    }

    Widget content() {
      return Expanded(
        flex: 10,
        child: Container(
          padding: EdgeInsets.only(right: 10, left: 10, top: 10),
          child: ListView.builder(
            itemBuilder: (context, i) {
              return Container(
                margin: EdgeInsets.only(bottom: 5),
                alignment: messages[i].msg_type == 'receive' ? Alignment.centerLeft:Alignment.centerRight,
                child: Container(
                  decoration: BoxDecoration(
                    color: messages[i].msg_type == 'receive' ? variable.primary.withOpacity(0.6):Colors.grey,
                    borderRadius: BorderRadius.circular(10)
                  ),
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(bottom: 5),
                        child: Text(messages[i].text, style: TextStyle(color: Colors.white),),
                      ),
                      Container(
                        child: Text(messages[i].time, style: TextStyle(color: Colors.white, fontSize: 10),),
                      )
                    ],
                  ),
                ),
              );
            },
            itemCount: messages.length,
          ),
        )
      );
    }

    Widget inputMsg() {
      return Container(
        padding: EdgeInsets.all(5),
        decoration: new BoxDecoration(
          color: Colors.white.withOpacity(0.7),
        ),
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 8,
              child: Container(
                decoration: BoxDecoration(
                  color: variable.primary.withOpacity(0.1),
                  borderRadius: BorderRadius.all(Radius.circular(100))
                ),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      flex: 9,
                      child: TextField(
                        // controller: emailController,
                        style: new TextStyle(color: Colors.grey),
                        decoration: new InputDecoration(
                          hintText: 'Send message',
                          hintStyle: TextStyle(color: Colors.grey),
                          contentPadding: EdgeInsets.all(10),
                          border: InputBorder.none
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Icon(Icons.insert_emoticon, color: Colors.grey,),
                    )
                  ],
                )
              )
            ),
            Expanded(
              flex: 1,
              child: InkWell(
                child: Icon(Icons.add, color: Colors.grey,),
              ),
            ),
          ],
        )
      );
    }

    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Container(
            color: Colors.grey.withOpacity(0.2),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                appBar(),
                content(),
                inputMsg()
              ],
            ),
          ),
        ),
      ),
    );
  }
}