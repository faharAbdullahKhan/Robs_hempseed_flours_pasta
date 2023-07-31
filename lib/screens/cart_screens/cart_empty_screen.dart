import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rob_flour_pasta_app/utils/general_helper.dart';
import 'package:rob_flour_pasta_app/widgets/label_text.dart';

class EmptyCartScreen extends StatelessWidget {
  const EmptyCartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: LabelText(
          text: "Cart",
          fontWeight: FontWeight.bold,
        ),
        leading: GestureDetector(
            onTap: () => GeneralHelper.popBack(),
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
              size: 20.sp,
            )),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [SvgPicture.asset("assets/empty_cart.svg")],
        ),
      ),
    );
  }
}
