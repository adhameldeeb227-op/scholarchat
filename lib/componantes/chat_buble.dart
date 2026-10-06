import 'package:chatappcleen/constants.dart';
import 'package:chatappcleen/models/message.dart';
import 'package:flutter/material.dart';

class ChatBuble extends StatelessWidget {
  const ChatBuble({
    super.key, 
    required this.message
  });
    final Message message;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
         padding: EdgeInsets.only(left:16 ,right: 32, top: 32 , bottom: 32) ,
        margin: EdgeInsets.symmetric(vertical: 8 , horizontal: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(32),
             topRight: Radius.circular(32),
              bottomLeft: Radius.circular(32),
          ),
          color: kPrimaryColor
        ),
        child: Text(message.message , style: TextStyle(
          color: Colors.white
        ),),
      ),
    );
  }
}

class ChatBubleForfriend extends StatelessWidget {
  const ChatBubleForfriend({
    super.key, 
    required this.message
  });
    final Message message;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
         padding: EdgeInsets.only(left:16 ,right: 32, top: 32 , bottom: 32) ,
        margin: EdgeInsets.symmetric(vertical: 8 , horizontal: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(32),
             topRight: Radius.circular(32),
              bottomRight: Radius.circular(32),
          ),
          color: Color(0xff006D84)
        ),
        child: Text(message.message , style: TextStyle(
          color: Colors.white
        ),),
      ),
    );
  }
}