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