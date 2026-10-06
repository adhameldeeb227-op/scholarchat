import 'package:chatappcleen/componantes/custom_button.dart';
import 'package:chatappcleen/componantes/custom_textfield.dart';
import 'package:chatappcleen/constants.dart';
import 'package:chatappcleen/pages/chat-page.dart';
import 'package:chatappcleen/pages/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
class RegisterPage extends StatefulWidget{
    RegisterPage({super.key});
 static String id = 'RegisterPage';

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
 String? email;

 String? password;

 bool isloding = false;

 GlobalKey<FormState> formkey = GlobalKey();

 TextEditingController emailController = TextEditingController();

 TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
   return ModalProgressHUD(
    inAsyncCall: isloding,
     child: Scaffold(
        backgroundColor: kPrimaryColor,
       body:Padding(
         padding: const EdgeInsets.symmetric(horizontal: 8),
         child: Form(
          key: formkey,
           child: ListView(
            children: [
               SizedBox(
            height: 75,
           ),
             Image.asset('assets/508-5089433_udwpkavheshnzsvjwahf-icon-electrical.png',
              width: 150,
             height: 150,
             ),
            SizedBox(
            height: 25,
           ),
             Center(
               child: Text(
                'ScholerChat',
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                  fontFamily: 'Pacifico'
                ),
               ),
             ),
              SizedBox(
            height: 55,
           ),
           Padding(
             padding: const EdgeInsets.symmetric(horizontal: 10),
             child: Align(
               alignment: Alignment.centerLeft,
               child: Text(
                  'Register',
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                  ),
                 ),
             ),
           ),
           SizedBox(
            height: 15,
           ),
            CustomTextfield(
              controller: emailController,
              onChanged: (data){
              email = data;
              },
              hinttext: 'Email',
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return '';
                }
                return null;
              },
            ),
            SizedBox(
              height: 10,
            ) ,
             
             CustomTextfield(
              controller: passwordController,
              onChanged: (data){
                password = data;
              },
              hinttext: 'Password',
              obscureText: true,
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return '';
                }
                return null;
              },
            ),
            SizedBox(
              height: 25,
            ),
           
            CustomButton(
              onTap: () async {
                if (!formkey.currentState!.validate()) {
                  showSnackBar(context, 'there is an error');
                  return;
                }
                isloding = true;
                setState(() {
                  
                });
                try {
                  await registerUser();
                  if (context.mounted) {
                    Navigator.pushNamed(context, ChatPage.id , arguments: email);
                  }
                } on FirebaseAuthException catch (ex) {
                  if (!context.mounted) return;
                  if (ex.code == 'weak-password') {
                    showSnackBar(context, 'weak password');
                  } else if (ex.code == 'email-already-in-use') {
                    showSnackBar(context, 'Emai-already-in-se');
                  } else {
                    showSnackBar(context, 'there is an error');
                  }
                } catch (ex) {
                  if (context.mounted) {
                    showSnackBar(context, 'there was an error');
                  }
                }
                isloding =false;
                setState(() {
                  
                });
              },
              text: 'Register',
            ),
           SizedBox(
            height: 15,
           ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Already have an account?  ',
           
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white
                ),
                )
              ,GestureDetector( onTap: (){
                  Navigator.pop(context, LoginPage.id);
                 
                },
                child: Text('Login',
                style: TextStyle(
                  fontSize: 16,
                  color:Color(0xffC7EDE6)
                ),),
              )
              ],
            ),
            ],
           ),
         ),
       )
      ),
   );
 
  }

  void showSnackBar(BuildContext context , String message) {
     ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content:Text(message)
        ),
        );
  }

  Future<void> registerUser() async {
    UserCredential user =await  FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email!, password: password!);
  }
}