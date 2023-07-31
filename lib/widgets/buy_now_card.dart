import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rob_flour_pasta_app/utils/colors.dart';
import 'package:rob_flour_pasta_app/widgets/label_text.dart';

class BuyNowItemCard extends StatelessWidget {
  const BuyNowItemCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Row(
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(20.r),
              child: Image.asset("assets/item.png", height: 120.h,)),
          SizedBox(
            width: 20.w,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(height: 5.h,),
              LabelText(
                text: "Rigatoni Pasta",
                color: buyNowLabelColor,
                size: 16.sp,
              ),
              LabelText(
                text: "pasta",
                color: buyNowLabelColor,
                size: 16.sp,
              ),
              Row(
                children: [
                  LabelText(
                    text: "\$76",
                    color: buyNowLabelColor,
                    size: 16.sp,
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width * 0.5,),
                  LabelText(
                    text: "x2",
                    color: buyNowLabelColor,
                    size: 16.sp,
                  ),
                ],
              ),
              SizedBox(height: 5.h,),

            ],
          )
        ],
      ),
    );
  }
}
