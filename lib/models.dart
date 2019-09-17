import 'package:meta/meta.dart';

class Message {
    String text;
    String time;
    String msg_type;

    Message({
      @required this.text,
      @required this.time,
      @required this.msg_type
    });
}

class ChatListModel {
  String sender;
  String last_msg;
  String avatar;

  ChatListModel({
    @required this.sender,
    @required this.last_msg,
    @required this.avatar
  });
}