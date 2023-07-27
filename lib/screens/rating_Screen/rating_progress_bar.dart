import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:rob_flour_pasta_app/utils/colors.dart';
import 'package:rob_flour_pasta_app/widgets/label_text.dart';

class RatingProgressBar extends StatefulWidget {
  final String name;
  final double progressPercentage ;
  const RatingProgressBar( {super.key, required this.name, required this.progressPercentage});

  @override
  State<RatingProgressBar> createState() => _RatingProgressBarState();
}

class _RatingProgressBarState extends State<RatingProgressBar> {
  @override
  Widget build(BuildContext context) {
    return   Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                LabelText(
                  text: widget.name,
                  size: 12.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ],
            ),
          ),
          LinearPercentIndicator(
            width: 210.13.w,
            lineHeight: 9.h,
            percent: widget.progressPercentage,
            barRadius: Radius.circular(50),
            backgroundColor: Colors.grey,
            progressColor: redColor,
          ),
        ],
      ),
    );
  }
}
