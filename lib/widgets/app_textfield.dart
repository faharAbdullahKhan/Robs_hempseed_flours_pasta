import 'package:flutter/material.dart';
import 'package:rob_flour_pasta_app/utils/colors.dart';

class AppTextField extends StatelessWidget {
  final TextEditingController textController;
  final String hintText;
  final bool isObscure;
  final textInputType;
  final bool enabled;
  const AppTextField({super.key, required this.textController, required this.hintText, this.textInputType,  this.isObscure = false,  this.enabled =true});

  @override
  Widget build(BuildContext context) {
    return  TextField(

      enabled: enabled,
      controller: textController,
      obscureText: isObscure,
      keyboardType: textInputType,
      decoration: InputDecoration(
        hintStyle:TextStyle(color: commentTextFileBOrder),
        hintText: hintText,
        filled: true,
        fillColor: textFieldBackgroundColor,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            width: 2.0,
            color: redColor,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const  BorderSide(
            width: 2.0,
            color: textFieldBackgroundColor,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            width: 2.0,
            color: textFieldBackgroundColor,
          ),
        ),

      ),
    );
  }
}
