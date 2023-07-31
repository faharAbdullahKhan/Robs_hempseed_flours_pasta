import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rob_flour_pasta_app/screens/login_screen.dart';
import 'package:rob_flour_pasta_app/utils/colors.dart';
import 'package:rob_flour_pasta_app/widgets/app_textfield.dart';
import 'package:rob_flour_pasta_app/widgets/big_text.dart';
import 'package:rob_flour_pasta_app/widgets/custom_button.dart';
import 'package:get/get.dart';
import 'package:rob_flour_pasta_app/widgets/label_text.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _firstNameTextController =
      TextEditingController();
  final TextEditingController _lastNameTextController = TextEditingController();
  final TextEditingController _mobileNumberTextController =
      TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();
  final TextEditingController _oldPasswordTextController =
      TextEditingController();
  final TextEditingController _newPasswordTextController =
      TextEditingController();
  final TextEditingController _confirmPasswordTextController =
      TextEditingController();
  final TextEditingController _addressTextController = TextEditingController();
  final ImagePicker _picker = ImagePicker();
  File? _selectedImage;
  bool isEditable = false;
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
  void initState() {
    _emailTextController.text = 'Rayandeck@gmail.com';
    _firstNameTextController.text = 'Deck';
    _lastNameTextController.text = 'Rayan';
    _mobileNumberTextController.text = '(71) 124 125 5553';
    _passwordTextController.text = '123456789';
    _addressTextController.text = '360 lexington avenue suite 1414 New York ';
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBarBackground,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Get.back(),
        ),
        backgroundColor: appBarBackground,
        elevation: 0,
        centerTitle: true,
        title: LabelText(
          text: "Profile",
          color: greenColor,
          fontWeight: FontWeight.w700,
          size: 25.sp,
        ),
        actions: [
          isEditable == false
              ? GestureDetector(
                  onTap: () {
                    setState(() {
                      isEditable = !isEditable;
                    });
                  },
                  child: Padding(
                    padding: EdgeInsets.only(right: 15.w),
                    child: SizedBox(
                      height: 25.h,
                      width: 25.w,
                      child: Image.asset(
                        'assets/Edit_Profile.png',
                      ),
                    ),
                  ),
                )
              : SizedBox()
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: ListView(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 50.h,
            ),
            // Expanded(child: Container()),
            // Center(child: SvgPicture.asset("assets/login_logo.svg")),
            // Expanded(child: Container()),
            SizedBox(
              height: 20.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Stack(
                    children: [
                      CircleAvatar(
                        backgroundColor: redColor,
                        radius: 100.46.r,
                        child: CircleAvatar(
                          backgroundColor: redColor,
                          radius: 90.46.r,
                          child: CircleAvatar(
                            backgroundColor: textFieldBackgroundColor,
                            backgroundImage: AssetImage(
                              _selectedImage != null
                                  ? _selectedImage!.path
                                  : 'assets/person_icon.png',
                            ),

                            // child: _selectedImage != null
                            //     ? SizedBox()
                            //     : Icon(Icons.person,
                            //         color: Colors.white), //NetworkImage
                            radius: 90.r,
                          ), //CircleAvatar
                        ), //CircleAvatar
                      ),
                      isEditable == true
                          ? Positioned(
                              bottom: 35.r,
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
                              ),
                            )
                          : SizedBox(),
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
                  color: labelTextColor,
                  size: 14.sp,
                ),
              ],
            ),
            SizedBox(
              height: 6.h,
            ),
            AppTextField(
              enabled: isEditable,
              textController: _firstNameTextController,
              hintText: _firstNameTextController.text,
            ),
            SizedBox(
              height: 20.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                BigText(
                  text: "Last Name",
                  color: labelTextColor,
                  size: 14.sp,
                ),
              ],
            ),
            SizedBox(
              height: 6.h,
            ),
            AppTextField(
              enabled: isEditable,
              textController: _lastNameTextController,
              hintText: "Deck",
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
                  color: labelTextColor,
                  size: 14.sp,
                ),
              ],
            ),
            SizedBox(
              height: 6.h,
            ),
            AppTextField(
              enabled: isEditable,
              textController: _emailTextController,
              hintText: "Rayandeck@gmail.com",
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
                  color: labelTextColor,
                  size: 14.sp,
                ),
              ],
            ),
            SizedBox(
              height: 6.h,
            ),
            AppTextField(
              enabled: isEditable,
              textController: _mobileNumberTextController,
              hintText: "(71) 124 125 5553",
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
                  color: labelTextColor,
                  size: 14.sp,
                ),
              ],
            ),
            SizedBox(
              height: 6.h,
            ),
            Row(
              children: [
                Expanded(
                  flex: 3,
                  child: AppTextField(
                    enabled: false,
                    textController: _passwordTextController,
                    hintText: "asdwqwert",
                    isObscure: true,
                  ),
                ),
                isEditable == true
                    ? Expanded(
                        child: GestureDetector(
                          onTap: () {
                            Get.defaultDialog(
                                title: "Change Password",
                                content: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          BigText(
                                            text: "Old Password",
                                            color: labelTextColor,
                                            size: 14.sp,
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 6.h,
                                      ),
                                      AppTextField(
                                        textController:
                                            _oldPasswordTextController,
                                        hintText: "Old Password",
                                        isObscure: true,
                                      ),
                                      SizedBox(
                                        height: 10.h,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          BigText(
                                            text: "New Password",
                                            color: labelTextColor,
                                            size: 14.sp,
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 6.h,
                                      ),
                                      AppTextField(
                                        textController:
                                            _newPasswordTextController,
                                        hintText: "New Password",
                                        isObscure: true,
                                      ),
                                      SizedBox(
                                        height: 10.h,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          BigText(
                                            text: "Confirm New Password",
                                            color: labelTextColor,
                                            size: 14.sp,
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 6.h,
                                      ),
                                      AppTextField(
                                        textController:
                                            _confirmPasswordTextController,
                                        hintText: "Confirm New Password",
                                        isObscure: true,
                                      ),
                                      SizedBox(
                                        height: 30.h,
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          Get.back();
                                        },
                                        child: Row(
                                          children: const [
                                            Expanded(
                                                child: CustomButton(
                                              text: 'SUBMIT',
                                            )),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                                // Dialog(
                                //   shape: RoundedRectangleBorder(
                                //     borderRadius: BorderRadius.circular(10.0),
                                //   ),
                                //   backgroundColor: Colors.white,
                                //   child: Padding(
                                //     padding: const EdgeInsets.all(20.0),
                                //     child: Column(
                                //       mainAxisAlignment:
                                //           MainAxisAlignment.center,
                                //       children: [
                                //         LabelText(
                                //           text: 'Change Password',
                                //           size: 16.98.sp,
                                //           fontWeight: FontWeight.w600,
                                //         ),
                                //         SizedBox(
                                //           height: 20.h,
                                //         ),
                                //         Row(
                                //           mainAxisAlignment:
                                //               MainAxisAlignment.start,
                                //           children: [
                                //             BigText(
                                //               text: "New Password",
                                //               color: labelTextColor,
                                //               size: 14.sp,
                                //             ),
                                //           ],
                                //         ),
                                //         SizedBox(
                                //           height: 6.h,
                                //         ),
                                //         AppTextField(
                                //           enabled: false,
                                //           textController:
                                //               _passwordTextController,
                                //           hintText: "passwords",
                                //           isObscure: true,
                                //         ),
                                //         SizedBox(
                                //           height: 10.h,
                                //         ),
                                //         Row(
                                //           mainAxisAlignment:
                                //               MainAxisAlignment.start,
                                //           children: [
                                //             BigText(
                                //               text: "Confirm New Password",
                                //               color: labelTextColor,
                                //               size: 14.sp,
                                //             ),
                                //           ],
                                //         ),
                                //         SizedBox(
                                //           height: 6.h,
                                //         ),
                                //         AppTextField(
                                //           enabled: false,
                                //           textController:
                                //               _passwordTextController,
                                //           hintText: "passwords",
                                //           isObscure: true,
                                //         ),
                                //         SizedBox(
                                //           height: 30.h,
                                //         ),
                                //         GestureDetector(
                                //           onTap: () {
                                //             Get.back();
                                //           },
                                //           child: Row(
                                //             children: const [
                                //               Expanded(
                                //                   child: CustomButton(
                                //                 text: 'SUBMIT',
                                //               )),
                                //             ],
                                //           ),
                                //         ),
                                //       ],
                                //     ),
                                //   ),
                                // ),
                                );
                          },
                          child: SizedBox(
                            height: 25.h,
                            width: 25.w,
                            child: Image.asset(
                              'assets/Edit_Profile.png',
                            ),
                          ),
                        ),
                      )
                    : SizedBox(),
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                BigText(
                  text: "Address",
                  color: labelTextColor,
                  size: 14.sp,
                ),
              ],
            ),
            SizedBox(
              height: 6.h,
            ),
            AppTextField(
              enabled: isEditable,
              textController: _addressTextController,
              hintText: "360 lexington avenue suite 1414 New York ",
            ),

            SizedBox(
              height: 30.h,
            ),
            isEditable == true
                ? Row(
                    children: const [
                      Expanded(
                          child: CustomButton(
                        text: 'UPDATE PROFILE',
                      )),
                    ],
                  )
                : SizedBox(),

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
