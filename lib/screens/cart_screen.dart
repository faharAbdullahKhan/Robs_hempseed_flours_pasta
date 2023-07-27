import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:rob_flour_pasta_app/controller/product_cart_controller.dart';
import 'package:rob_flour_pasta_app/utils/colors.dart';
import 'package:rob_flour_pasta_app/utils/general_helper.dart';
import 'package:rob_flour_pasta_app/widgets/big_text.dart';
import 'package:rob_flour_pasta_app/widgets/cart_bottom_sheet.dart';
import 'package:rob_flour_pasta_app/widgets/cart_card.dart';
import 'package:rob_flour_pasta_app/widgets/custom_button.dart';
import 'package:rob_flour_pasta_app/widgets/label_text.dart';
import 'package:rob_flour_pasta_app/widgets/swipe_delete.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
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
      body: Container(
        height: MediaQuery.of(context).size.height * 0.4,
        child: ListView(
          children: List.generate(
            2,
            (index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: SlideMenu(
                  child: CartCard(),
                  menuItems: <Widget>[
                    SvgPicture.asset(
                      "assets/bin.svg",
                      height: 35.h,
                    )
                  ],
                ),
              );
            },
          ).toList(),
        ),
      ),
      bottomSheet: Container(
        height: MediaQuery.of(context).size.height * 0.5,
        padding: EdgeInsets.all(30.r),
        decoration: BoxDecoration(color: greenColor, borderRadius: BorderRadius.only(topRight: Radius.circular(50.r), topLeft: Radius.circular(50.r))),
        child: Column(
          children: [
            Expanded(child: Container()),
            CartBottomSheet(labelText: "Denim Shirt", priceText: "\$38.00",),
            SizedBox(height: 20.h,),
            Container(
              height: 1.h,
              decoration: const BoxDecoration(color: Colors.white),
            ),
            SizedBox(height: 20.h,),

            CartBottomSheet(labelText: "Denim Shirt", priceText: "\$38.00",),
            SizedBox(height: 20.h,),
            Container(
              height: 1.h,
              decoration: const BoxDecoration(color: Colors.white),
            ),
            SizedBox(height: 20.h,),

            CartBottomSheet(labelText: "Denim Shirt", priceText: "\$38.00",),
            SizedBox(height: 20.h,),
            Container(
              height: 1.h,
              decoration: const BoxDecoration(color: Colors.white),
            ),
            SizedBox(height: 20.h,),
            CartBottomSheet(labelText: "Denim Shirt", priceText: "\$38.00",),
            SizedBox(height: 20.h,),
            Container(
              height: 1.h,
              decoration: const BoxDecoration(color: Colors.white),
            ),
            SizedBox(height: 20.h,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                LabelText(text: "Total", color: Colors.white, size: 16.sp),
                LabelText(
                  text: "\$ 65.69",
                  color: Colors.white,
                  size: 20.sp,
                  fontWeight: FontWeight.bold,
                ),
              ],
            ),
            SizedBox(height: 20.h,),
            CustomButton(text: 'checkout',),
            SizedBox(height: 20.h,),


          ],
        ),
      ),
    );
  }
}
