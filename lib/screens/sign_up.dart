import 'dart:io';
import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rob_flour_pasta_app/screens/login_screen.dart';
import 'package:rob_flour_pasta_app/utils/colors.dart';
import 'package:rob_flour_pasta_app/utils/image_picker.dart';
import 'package:rob_flour_pasta_app/widgets/app_textfield.dart';
import 'package:rob_flour_pasta_app/widgets/big_text.dart';
import 'package:rob_flour_pasta_app/widgets/custom_button.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _firstNameTextController =
      TextEditingController();
  final TextEditingController _lastNameTextController = TextEditingController();
  final TextEditingController _mobileNumberTextController =
      TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();

  final TextEditingController _confirmPasswordTextController =
      TextEditingController();
  ImagePicker _picker = ImagePicker();
  File? _selectedImage;

  pickerImage(ImageSource source) async {
    XFile? _file = await _picker.pickImage(source: source);

    if (_file != null) {
      File file = File(_file.path);
      setState(() {
        _selectedImage = file;
      });
      return file;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: ListView(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 50.h,
            ),
            // Expanded(child: Container()),
            Center(child: SvgPicture.asset("assets/login_logo.svg")),
            // Expanded(child: Container()),
            SizedBox(
              height: 20.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Center(
                  child: Stack(
                    children: [
                      CircleAvatar(
                        backgroundColor: redColor,
                        radius: 70.h,
                        child: CircleAvatar(
                          backgroundColor: redColor,
                          radius: 65.h,
                          child: CircleAvatar(

                            backgroundColor: textFieldBackgroundColor,
                            backgroundImage: AssetImage(_selectedImage != null
                                ? _selectedImage!.path
                                : 'assets/person_icon.png',),

                            // child: _selectedImage != null
                            //     ? SizedBox()
                            //     : Icon(Icons.person,
                            //         color: Colors.white), //NetworkImage
                            radius: 65.h,
                          ), //CircleAvatar
                        ), //CircleAvatar
                      ),
                      Positioned(
                          bottom: 10,
                          right: 0,
                          child: GestureDetector(
                            onTap: () async {
                              pickerImage(ImageSource.gallery);
                            },
                            child: Container(
                                decoration: BoxDecoration(
                                  color: redColor,
                                  shape: BoxShape.circle,
                                ),
                                width: 40.w,
                                height: 40.h,
                                child: Icon(
                                  Icons.add_a_photo,
                                  color: Colors.white,
                                  size: 20.h,
                                )),
                          )),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                BigText(
                  text: "First Name",
                  color: labelColor,
                  size: 14.sp,
                ),
              ],
            ),
            SizedBox(
              height: 6.h,
            ),
            AppTextField(
                textController: _firstNameTextController, hintText: ""),
            SizedBox(
              height: 20.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                BigText(
                  text: "Last Name",
                  color: labelColor,
                  size: 14.sp,
                ),
              ],
            ),
            SizedBox(
              height: 6.h,
            ),
            AppTextField(
              textController: _lastNameTextController,
              hintText: "",
              isObscure: false,
            ),
            SizedBox(
              height: 20.h,
            ),
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
            AppTextField(
              textController: _emailTextController,
              hintText: "",
              isObscure: false,
            ),
            SizedBox(
              height: 20.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                BigText(
                  text: "Mobile Number",
                  color: labelColor,
                  size: 14.sp,
                ),
              ],
            ),
            SizedBox(
              height: 6.h,
            ),
            AppTextField(
              textController: _mobileNumberTextController,
              hintText: "",
              textInputType: TextInputType.number,
              isObscure: false,
            ),
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
              height: 20.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                BigText(
                  text: "Confirm Password",
                  color: labelColor,
                  size: 14.sp,
                ),
              ],
            ),
            SizedBox(
              height: 6.h,
            ),
            AppTextField(
              textController: _confirmPasswordTextController,
              hintText: "",
              isObscure: true,
            ),

            SizedBox(
              height: 30.h,
            ),
            Row(
              children: const [
                Expanded(
                    child: CustomButton(
                  text: 'Sign Up',
                )),
              ],
            ),
            SizedBox(
              height: 20.h,
            ),

            Center(
              child: GestureDetector(
                onTap: () {
                  Get.to(() => const LoginScreen());
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("I'm already a member"  , style: TextStyle(
                  fontSize: 10.42.sp,
                ),),
                    Text(
                      ' Login',
                      style: TextStyle(
                          fontSize: 10.42.sp,
                          color: redColor,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            // Expanded(child: Container()),
          ],
        ),
      ),
    );
  }
}
