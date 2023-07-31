import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rob_flour_pasta_app/utils/colors.dart';
import 'package:rob_flour_pasta_app/widgets/label_text.dart';

class OrderCard extends StatelessWidget {
  const OrderCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.r),
        boxShadow: [
          BoxShadow(
            blurRadius: 1,
            spreadRadius: 2,
            offset: const Offset(1, 3),
            color: Colors.grey.withOpacity(0.2),
          )
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset("assets/item.png"),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10.h,
                ),
                LabelText(
                  text: "Shipped Out",
                  fontWeight: FontWeight.bold,
                  color: orderScreenLabelColor,
                ),
                SizedBox(
                  height: 10.h,
                ),
                SizedBox(
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: RichText(
                      text: TextSpan(
                        text: 'Parcel ',
                        style: DefaultTextStyle.of(context).style,
                        children: const <TextSpan>[
                          TextSpan(
                              text: 'JHS1937837871',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          TextSpan(
                              text:
                                  ' for you order 29137173BS has been shipped out by '),
                          TextSpan(
                              text: 'Robs hempseed flour pasta',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        ],
                      ),
                    )),
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(),
                    SvgPicture.asset("assets/clock.svg"),
                    SizedBox(width: 5.w,),
                    LabelText(text: "23 April 2022",size: 12.sp,),
                    SizedBox(width: 5.w,),
                    LabelText(text: "14:40",size: 12.sp,color: redColor,)
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
