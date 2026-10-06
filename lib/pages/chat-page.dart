import 'package:chatappcleen/componantes/chat_buble.dart';
import 'package:chatappcleen/constants.dart';
import 'package:chatappcleen/models/message.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatPage extends StatelessWidget{
 
 static String id = 'chatpage';
 final _controller = ScrollController();
 CollectionReference messages = FirebaseFirestore.instance.collection(kmessagescollection);
 TextEditingController controller =TextEditingController();
  @override
  Widget build(BuildContext context){
  var email=  ModalRoute.of(context)!.settings.arguments;
    return StreamBuilder<QuerySnapshot>(
      stream: messages.orderBy(KCratedAt , descending: true).snapshots(),
      builder: (context, snapshot) {

      if (snapshot.hasData){
        List<Message> messageslist=[];
        for(int i=0 ; i<snapshot.data!.docs.length ; i++){
          messageslist.add(Message.fromjason(snapshot.data!.docs[i]));
        }
        return Scaffold(
  appBar: AppBar(
  automaticallyImplyLeading: true,
  title: Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      ColorFiltered(
        colorFilter: ColorFilter.mode(
          kPrimaryColor,
          BlendMode.multiply,
        ),
        child: Image.asset(klogo, height: 50, width: 50),
      ),
      Text('chat'),
    ],
  ),
  centerTitle: true,
  backgroundColor: kPrimaryColor,
),
  body: Column(
    children: [
      Expanded(
        child: ListView.builder(
          reverse: true,
          controller: _controller,
          itemCount: messageslist.length,
          itemBuilder: (context,index){
          return messageslist[index].id == email ?
           ChatBuble(message: messageslist[index],
           ) : ChatBubleForfriend(message: messageslist[index]);
        }),
      ),
      Padding(
        padding: const EdgeInsets.all(16),
        child: TextField(
          controller: controller,
          onSubmitted: (data){
            messages.add({
              kmessage :data,
              KCratedAt : DateTime.now() ,
              'id' : email
            });
            controller.clear();
            _controller.animateTo(0,
             duration: (Duration(seconds: 1)), curve: Curves.easeIn);
          },
          decoration: InputDecoration(
            hintText: 'send message',
            suffixIcon: Icon(
              Icons.send,
              color:kPrimaryColor,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16)
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16)
            )
          ),
        ),
      )
    ],
  )
    );
      }else{
        return Text('Loading....');
      }
    },
    );
  }
}

