import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rob_flour_pasta_app/utils/colors.dart';
import 'package:rob_flour_pasta_app/widgets/big_text.dart';
import 'package:rob_flour_pasta_app/widgets/label_text.dart';

class CartCard extends StatefulWidget {
  const CartCard({super.key});

  @override
  State<CartCard> createState() => _CartCardState();
}

class _CartCardState extends State<CartCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            blurRadius: 3,
            spreadRadius: 1,
            offset: const Offset(1, 2),
            color: Colors.grey.withOpacity(0.2),
          )
        ],
        borderRadius: BorderRadius.circular(10.r)
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            "assets/item.png",
            height: 100.h,
          ),
          SizedBox(width: 10.w,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              LabelText(
                text: "Rigatani Pasta",
                fontWeight: FontWeight.w800,
                size: 18.sp,
              ),
              SizedBox(height: 10.h,),
              LabelText(
                text: "Pasta",
                fontWeight: FontWeight.w800,
                color: cartCategoryLabelColor,
                size: 18.sp,
              ),
              SizedBox(height: 10.h,),

              LabelText(
                text: "\$ 38.00",
                fontWeight: FontWeight.bold,
                color: redColor,
                size: 22.sp,
              )
            ],
          ),
          Expanded(child: Container()),
          Container(
            padding: EdgeInsets.symmetric(vertical:13.r, horizontal: 10),
            decoration:  BoxDecoration(
              color: counterContainerColor,
              borderRadius: BorderRadius.circular(10.r)
            ),
            child: Row(children: [
              Container(
                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(4.r)),
                child: Icon(Icons.add, size: 20,),
              ),
              SizedBox(width: 10.w,),
              LabelText(text: "0", fontWeight: FontWeight.w800,),
              SizedBox(width: 10.w,),

              Container(
                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(4.r)),
                child: Icon(Icons.remove, size: 20,),
              ),

            ],),
          ),
          SizedBox(width: 10.w,),

        ],
      ),
    );
  }
}
