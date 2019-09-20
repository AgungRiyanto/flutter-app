import 'package:meta/meta.dart';

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