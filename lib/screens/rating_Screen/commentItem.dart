import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rob_flour_pasta_app/utils/colors.dart';
import 'package:rob_flour_pasta_app/widgets/label_text.dart';

class CommentItem extends StatefulWidget {
  const CommentItem({super.key});

  @override
  State<CommentItem> createState() => _CommentItemState();
}

class _CommentItemState extends State<CommentItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.all(30.0.r),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              color: appBarBackground,
              elevation: 1,
              child: Container(
                width: double.infinity,
                height: 300.h,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: 20.0.r, vertical: 20.0.r),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              LabelText(
                                text: 'Helene Moore',
                                size: 14.sp,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                              RatingBar.builder(
                                initialRating: 4.0,
                                minRating: 1,
                                direction: Axis.horizontal,
                                ignoreGestures: true,
                                allowHalfRating: true,
                                itemSize: 15.0,
                                itemCount: 5,
                                itemPadding:
                                    EdgeInsets.symmetric(horizontal: 0.0),
                                itemBuilder: (context, _) => Icon(
                                  Icons.star,
                                  color: ratingPageStarYellowIconColor,
                                ),
                                onRatingUpdate: (rating) {
                                  print(rating);
                                },
                              ),
                            ],
                          ),
                          LabelText(
                            text: 'June 5 ,2019',
                            size: 11.sp,
                            fontWeight: FontWeight.w400,
                            color: dateColor,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      LabelText(
                        text:
                            "The dress is great! Very classy and comfortable. It fit perfectly! I'm 5'7' and 130 pounds. I am a 34B chest. This dress would be too long for those who are shorter but could be hemmed. I wouldn't recommend it for those big chested as I am smaller chested and it fit me perfectly. The underarms were not too wide and the dress was made well.",
                        size: 14.sp,
                        fontWeight: FontWeight.w300,
                        color: commentColor,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          LabelText(
                            text: "Helpful",
                            size: 10.sp,
                            fontWeight: FontWeight.w300,
                            color: dateColor,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Icon(
                            Icons.thumb_up,
                            size: 15.r,
                            color: dateColor,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            child: Container(
              padding: EdgeInsets.all(6.r),
              width: 50.w,
              height: 50.w,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(100.r),
                  child: Image.network(
                      fit: BoxFit.cover,
                      "https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=987&q=80")),
            ),
          ),
        ],
      ),
    );
  }
}
