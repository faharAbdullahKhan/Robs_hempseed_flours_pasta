import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rob_flour_pasta_app/utils/colors.dart';

class SearchTextField extends StatelessWidget {
  final TextEditingController textController;
  final String hintText;
  final textInputType;
  const SearchTextField({super.key, required this.textController, required this.hintText, this.textInputType});

  @override
  Widget build(BuildContext context) {
    return  TextField(
      controller: textController,
      keyboardType: textInputType,
      decoration: InputDecoration(
        hintText: hintText,
        filled: true,
        fillColor: textFieldBackgroundColor,
        hintStyle: TextStyle(color: searchHintColor),
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
        prefixIcon: Padding(
          padding:  EdgeInsets.all(15.0.r),
          child: SvgPicture.asset("assets/search.svg"),
        ),

      ),
    );
  }
}
