import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rob_flour_pasta_app/screens/main_screen/home_screen.dart';
import 'package:rob_flour_pasta_app/screens/product_details_page.dart';
import 'package:rob_flour_pasta_app/utils/colors.dart';
import 'package:rob_flour_pasta_app/widgets/label_text.dart';
import 'package:get/get.dart';

class ItemCard extends StatefulWidget {
  const ItemCard({super.key});

  @override
  State<ItemCard> createState() => _ItemCardState();
}

class _ItemCardState extends State<ItemCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(ProductDetailsScreen());
      },
      child: Container(
        // width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: textFieldBackgroundColor,
            borderRadius: BorderRadius.circular(20.r)),
        child: Column(
          children: [
            SizedBox(
              height: 10.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  padding: EdgeInsets.all(5.r),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: Colors.white),
                  child: Icon(Icons.favorite_border),
                ),
                SizedBox(
                  width: 10.w,
                )
              ],
            ),
            Expanded(child: Image.asset("assets/item.png")),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      LabelText(
                        text: "Best seller",
                        color: redColor,
                        size: 16.sp,
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      LabelText(
                        text: "Most popular",
                        color: specialOfferColor,
                      ),
                      SizedBox(
                        height: 3.h,
                      ),
                      LabelText(
                        text: "\$50.99",
                        color: specialOfferColor,
                        size: 18.sp,
                      ),
                    ],
                  ),
                ),
                Expanded(child: Container()),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SvgPicture.asset(
                      "assets/add.svg",
                      height: 40.h,
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
