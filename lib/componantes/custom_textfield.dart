import 'package:flutter/material.dart';
class CustomTextfield extends StatelessWidget{
   CustomTextfield({super.key, this.hinttext, this.onChanged, this.validator, this.obscureText = false, this.controller});
  String? hinttext;
  Function(String)? onChanged;
  String? Function(String?)? validator;
  bool obscureText;
  TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      onChanged: onChanged,
      obscureText: obscureText,
      style: TextStyle(
        color: Colors.white
      ),
        decoration: InputDecoration(
          hintText: hinttext,
          hintStyle: TextStyle(
            color: Colors.white
          ),
          enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
             color:Colors.white
          )
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(
             color:Colors.white
          )
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
             color: Colors.red,
             width: 2,
          )
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
             color: Colors.red,
             width: 2,
          )
        ),
       )
       );
       }
      }