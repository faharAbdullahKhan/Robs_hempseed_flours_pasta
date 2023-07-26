import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:rob_flour_pasta_app/screens/sign_up.dart';
import 'package:rob_flour_pasta_app/screens/main_screen/main_page.dart';
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
        padding: EdgeInsets.symmetric(horizontal: 20.0.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(flex: 3, child: Container()),
            Center(child: SvgPicture.asset("assets/login_logo.svg")),
            Expanded(child: Container()),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                BigText(
                  text: "Email",
                  color: labelTextColor,
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
                  color: labelTextColor,
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
            SizedBox(
              height: 30.h,
            ),
            GestureDetector(
              onTap: (){
                Get.to(() => const HomePage());

              },
              child: Row(
                children: const [
                  Expanded(
                      child: CustomButton(
                    text: 'Login',
                  )),
                ],
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Row(
              children: [
                SizedBox(
                  width: 20.w,
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12.0.w),
                    child: Container(
                      height: 1,
                      // width: 20,
                      color: dividerColor,
                    ),
                  ),
                ),
                SizedBox(
                  width: 10.w,
                ),
                BigText(
                  text: "OR",
                  size: 16.sp,
                  color: dividerColor,
                ),
                SizedBox(
                  width: 10.w,
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12.0.w),
                    child: Container(
                      height: 1,
                      // width: 20,
                      color: dividerColor,
                    ),
                  ),
                ),
                SizedBox(
                  width: 20.w,
                ),
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            Container(
              padding: EdgeInsets.all(6.r),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50.r),
                  color: socialButtonBackgroundColor),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/google.png",
                    height: 40.5.h,
                    width: 40.5.w,
                  ),
                  BigText(
                    text: "Connect with Google",
                    size: 16.sp,
                    fontWeight: FontWeight.w600,
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Container(
              padding: EdgeInsets.all(15.r),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50.r),
                  color: socialButtonBackgroundColor),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    "assets/facebook-logo.svg",
                    // height: 30.5.h,
                    // width: 30.5.w,
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  BigText(
                    text: "Connect with Facebook",
                    size: 16.sp,
                    fontWeight: FontWeight.w600,
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Container(
              padding: EdgeInsets.all(15.r),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50.r),
                  color: socialButtonBackgroundColor),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    "assets/apple_logo.svg",
                    // height: 30.5.h,
                    // width: 30.5.w,
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  BigText(
                    text: "Connect with Apple",
                    size: 16.sp,
                    fontWeight: FontWeight.w600,
                  )
                ],
              ),
            ),
            SizedBox(
              height: 25.h,
            ),
            GestureDetector(
              onTap: (){  Get.to(() =>  SignUpScreen());},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  BigText(
                    text: "Need an account?",
                    size: 16.42.sp,
                    fontWeight: FontWeight.w700,
                  ),
                  BigText(
                    text: " Sign Up",
                    size: 16.42.sp,
                    fontWeight: FontWeight.w700,
                    color: redColor,
                  )
                ],
              ),
            ),
            Expanded(child: Container()),
          ],
        ),
      ),
    );
  }
}
