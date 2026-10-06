/*import 'package:chatappcleen/componantes/custom_button.dart';
import 'package:chatappcleen/componantes/custom_textfield.dart';
import 'package:chatappcleen/constants.dart';
import 'package:chatappcleen/pages/register_page.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';


class LoginPage extends StatefulWidget{
   LoginPage({super.key});
   static String id = 'LoginPage';

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isloding = false;

 GlobalKey<FormState> formkey = GlobalKey();

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
                  'Sign In',
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
              hinttext: 'Email',
            ),
            SizedBox(
              height: 10,
            ) ,
             
             CustomTextfield(
              hinttext: 'Password',
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
                    showSnackBar(context, 'Sucsses');
                    emailController.clear();
                    passwordController.clear();
                    email = null;
                    password = null;
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
              text: 'Sign In',
            ),
           SizedBox(
            height: 15,
           ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('dont have an account?  ',
                 
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white
                ),
                )
              ,GestureDetector(
                onTap: (){
                  Navigator.pushNamed(context, RegisterPage.id);
                },
                child: Text('Register',
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
  
}*/


import 'package:chatappcleen/componantes/custom_button.dart';
import 'package:chatappcleen/componantes/custom_textfield.dart';
import 'package:chatappcleen/constants.dart';
import 'package:chatappcleen/pages/chat-page.dart';
import 'package:chatappcleen/pages/register_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
class LoginPage extends StatefulWidget{
   const LoginPage({super.key});
   static String id = 'LoginPage';

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
                  'Sign In',
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
                  await LoginUser();
                  if (context.mounted) {
                   Navigator.pushNamed(context,ChatPage.id ,arguments: email);
                  }
                } on FirebaseAuthException catch (ex) {
                  if (!context.mounted) return;
                  if (ex.code == 'user-not-found') {
                    showSnackBar(context, 'user not found');
                  } else if (ex.code == 'invalid-credential') {
                    showSnackBar(context, 'wrong password');
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
              text: 'Sign in',
            ),
           SizedBox(
            height: 15,
           ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Dont have an account?  ',
           
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white
                ),
                )
              ,GestureDetector( onTap: (){
                  Navigator.pushNamed(context, RegisterPage.id);
                 
                },
                child: Text('Regester',
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

  Future<void> LoginUser() async {
    UserCredential user =await  FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email!, password: password!);
  }
}