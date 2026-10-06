import 'package:chatappcleen/constants.dart';

class Message {
  final String message;
  final String id;

  Message (this.message , this.id);

  factory Message.fromjason(jasondata)
  {
   final data = jasondata.data() as Map<String, dynamic>;
  return Message(data[kmessage] , data["id"]);
  }
}
