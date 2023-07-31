import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:rob_flour_pasta_app/screens/main_screen/main_page.dart';
import 'package:rob_flour_pasta_app/screens/rating_Screen/commentItem.dart';
import 'package:rob_flour_pasta_app/screens/rating_Screen/rating_progress_bar.dart';
import 'package:rob_flour_pasta_app/utils/colors.dart';
import 'package:rob_flour_pasta_app/widgets/app_textfield.dart';
import 'package:rob_flour_pasta_app/widgets/custom_button.dart';
import 'package:rob_flour_pasta_app/widgets/label_text.dart';
import 'package:get/get.dart';

class ratingAndReviews extends StatefulWidget {
  const ratingAndReviews({super.key});

  @override
  State<ratingAndReviews> createState() => _ratingAndReviewsState();
}

class _ratingAndReviewsState extends State<ratingAndReviews> {
  final TextEditingController _commentTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: redColor,
        child: Icon(
          Icons.star,
          size: 40.w,
        ),
        onPressed: () {
          Get.dialog(
            Dialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              backgroundColor: Colors.white,
              child: SizedBox(
                height: MediaQuery.of(context).size.height / 2,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      LabelText(

                        text: 'Your opinion matter',
                        size: 16.98.sp,
                        fontWeight: FontWeight.w600,
                      ),
                      LabelText(

                        text: 'to us',
                        size: 16.98.sp,
                        fontWeight: FontWeight.w600,
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      RatingBar.builder(
                        unratedColor: carasoulBackground,
                        initialRating: 0.0,
                        minRating: 1,
                        direction: Axis.horizontal,
                        ignoreGestures: false,
                        allowHalfRating: true,
                        itemSize: 25.0,
                        itemCount: 5,
                        itemPadding: EdgeInsets.symmetric(horizontal: 0.0),
                        itemBuilder: (context, _) => Icon(
                          Icons.star,
                          color: ratingPageStarYellowIconColor,
                        ),
                        onRatingUpdate: (rating) {
                          print(rating);
                        },
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      TextField(
                        controller: _commentTextController,
                        obscureText: false,
                        maxLines: 4, // Set this
                        //expands: true, // and
                        keyboardType: TextInputType.multiline,
                        decoration: InputDecoration(
                          hintText: 'Comment...',
                          filled: true,
                          fillColor: commentBackgroundColor,
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(
                              width: 1.0,
                              color: commentTextFileBOrder,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(
                              width: 1.0,
                              color: textFieldBackgroundColor,
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(
                              width: 1.0,
                              color: textFieldBackgroundColor,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      GestureDetector(
                        onTap: (){
                          Get.back();

                        },
                        child: Row(
                          children: const [
                            Expanded(
                                child: CustomButton(
                                  text: 'SUBMIT',
                                )),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
      backgroundColor: appBarBackground,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        centerTitle: true,
        title: LabelText(
          text: 'Rating & Reviews',
          size: 20.sp,
          fontWeight: FontWeight.w900,
        ),
        backgroundColor: appBarBackground,
        elevation: 0,
      ),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              LabelText(
                text: '4.5',
                size: 75.sp,
                fontWeight: FontWeight.w900,
              ),
              RatingBar.builder(
                initialRating: 4.5,
                minRating: 1,
                direction: Axis.horizontal,
                ignoreGestures: true,
                allowHalfRating: true,
                itemCount: 5,
                itemSize: 30,
                itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
                itemBuilder: (context, _) => Icon(
                  Icons.star,
                  color: ratingPageStarYellowIconColor,
                ),
                onRatingUpdate: (rating) {
                  print(rating);
                },
              ),
              SizedBox(
                height: 5,
              ),
              LabelText(
                text: 'Based On 20 Review',
                size: 14.65.sp,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ),
              SizedBox(
                height: 10,
              ),
              const Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2),
                child: RatingProgressBar(
                  name: 'Excellent',
                  progressPercentage: 0.8,
                ),
              ),
              const Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2),
                child: RatingProgressBar(
                  name: 'Good',
                  progressPercentage: 0.7,
                ),
              ),
              const Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2),
                child: RatingProgressBar(
                  name: 'Average',
                  progressPercentage: 0.6,
                ),
              ),
              const Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2),
                child: RatingProgressBar(
                  name: 'Below Average',
                  progressPercentage: 0.5,
                ),
              ),
              const Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2),
                child: RatingProgressBar(
                  name: 'Poor',
                  progressPercentage: 0.4,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: Row(
                  children: [
                    LabelText(
                      text: '8 REVIEWS',
                      size: 20.sp,
                      fontWeight: FontWeight.w900,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    CommentItem(),
                    CommentItem(),
                    CommentItem(),
                    CommentItem(),
                    CommentItem(),
                    SizedBox(
                      height: 50.h,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
