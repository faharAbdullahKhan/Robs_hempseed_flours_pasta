import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:rob_flour_pasta_app/utils/colors.dart';
import 'package:rob_flour_pasta_app/widgets/app_textfield.dart';
import 'package:rob_flour_pasta_app/widgets/big_text.dart';
import 'package:rob_flour_pasta_app/widgets/custom_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(child: Container()),
            Center(child: SvgPicture.asset("assets/login_logo.svg")),
            Expanded(child: Container()),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                BigText(
                  text: "Email",
                  color: labelColor,
                  size: 14.sp,
                ),
              ],
            ),
            SizedBox(
              height: 6.h,
            ),
            AppTextField(textController: _emailTextController, hintText: ""),
            SizedBox(
              height: 20.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                BigText(
                  text: "Password",
                  color: labelColor,
                  size: 14.sp,
                ),
              ],
            ),
            SizedBox(
              height: 6.h,
            ),
            AppTextField(
              textController: _passwordTextController,
              hintText: "",
              isObscure: true,
            ),
            SizedBox(
              height: 12.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                BigText(
                  text: "Forgot Password",
                  color: redColor,
                  size: 13.sp,
                  fontWeight: FontWeight.w500,
                  textDecoration: TextDecoration.underline,
                ),
              ],
            ),
            SizedBox(height: 30.h,),
            Row(
              children: const [
                Expanded(child: CustomButton(text: 'Login',)),
              ],
            ),
            SizedBox(height: 20.h,),

            Row(children: [
              Expanded(
                child: Container(
                  height: 1,
                  // width: 20,
                  color: dividerColor,
                ),
              ),
              SizedBox(width: 10.w,),
              BigText(text: "OR",size: 14.sp,color: dividerColor,),
              SizedBox(width: 10.w,),
              Expanded(
                child: Container(
                  height: 1,
                  // width: 20,
                  color: dividerColor,
                ),
              ),

            ],),


            Expanded(child: Container()),
          ],
        ),
      ),
    );
  }
}
