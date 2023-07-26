import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:rob_flour_pasta_app/screens/login_screen.dart';
import 'package:rob_flour_pasta_app/screens/main_screen/main_page.dart';
import 'package:rob_flour_pasta_app/screens/main_screen/main_screen.dart';
import 'package:rob_flour_pasta_app/utils/colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  static int splashDuration = 3;


  @override
  void initState() {
    // TODO: implement initState
    Timer(Duration(seconds: splashDuration), () {
      Get.to(() => const LoginScreen());
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: greenColor,
      body: Stack(
        children: [
          Positioned(
              right: 0,
              child: SvgPicture.asset("assets/upper_lines.svg")),

          Positioned(
              bottom: 0,
              right: 0,
              child: SvgPicture.asset("assets/bottom_icon.svg")),

          Center(child: SvgPicture.asset("assets/app_logo.svg"))
        ],
      ),
    );
  }
}
