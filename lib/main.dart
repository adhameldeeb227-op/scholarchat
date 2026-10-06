import 'package:chatappcleen/firebase_options.dart';
import 'package:chatappcleen/pages/chat-page.dart';
import 'package:chatappcleen/pages/login_page.dart';
import 'package:chatappcleen/pages/register_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
   WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(ScholarChat());
}
class ScholarChat extends StatelessWidget {
  const ScholarChat({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        LoginPage.id :(context) => LoginPage(),
        RegisterPage.id : (context) =>RegisterPage(),
        ChatPage.id :(context) => ChatPage()

      },
     initialRoute: 'LoginPage',
    );
  }
}