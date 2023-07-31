import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rob_flour_pasta_app/screens/edit_profile_screen.dart';
import 'package:rob_flour_pasta_app/utils/colors.dart';
import 'package:rob_flour_pasta_app/widgets/big_text.dart';
import 'package:rob_flour_pasta_app/widgets/label_text.dart';
import 'package:get/get.dart';
class DrawerScreen extends StatefulWidget {
  const DrawerScreen({Key? key}) : super(key: key);

  @override
  _DrawerScreenState createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: greenColor,
      body: Padding(
        padding: EdgeInsets.only(top: 50.0.h, left: 20.w),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 50.h,
            ),
            GestureDetector(
              onTap: () {
                Get.to(EditProfileScreen());
              },
              child: Container(
                padding: EdgeInsets.all(6.r),
                width: 100.w,
                height: 100.h,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: greenColor),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(100.r),
                    child: Image.network(
                        fit: BoxFit.cover,
                        "https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=987&q=80")),
              ),
            ),
            SizedBox(
              height: 40.h,
            ),
            Container(
              child: Row(
                children: [
                  SvgPicture.asset(
                    "assets/help.svg",
                    height: 25.h,
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  LabelText(
                    text: "Help",
                    color: Colors.white,
                  )
                ],
              ),
            ),
            SizedBox(
              height: 40.h,
            ),
            Row(
              children: [
                SvgPicture.asset(
                  "assets/terms_condition_icon.svg",
                  height: 25.h,
                ),
                SizedBox(
                  width: 10.w,
                ),
                LabelText(
                  text: "Terms and Condition ",
                  color: Colors.white,
                )
              ],
            ),
            SizedBox(
              height: 40.h,
            ),
            Row(
              children: [
                SvgPicture.asset(
                  "assets/privacy_logo.svg",
                  height: 25.h,
                ),
                SizedBox(
                  width: 10.w,
                ),
                LabelText(
                  text: "Privacy policy",
                  color: Colors.white,
                )
              ],
            ),
          ],
        ),
      ),
      bottomSheet: Container(
        padding: EdgeInsets.only(left: 30.w),
        // width: 30,
        height: 200,
        color: greenColor,
        child: Row(
          children: [
            Icon(
              Icons.logout,
              color: Colors.white,
            ),
            SizedBox(
              width: 10.w,
            ),
            BigText(
              text: "Log out",
              color: Colors.white,
            )
          ],
        ),
      ),
    );
  }
}
