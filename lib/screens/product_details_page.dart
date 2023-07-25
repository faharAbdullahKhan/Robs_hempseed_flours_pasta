import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rob_flour_pasta_app/utils/colors.dart';
import 'package:rob_flour_pasta_app/widgets/big_text.dart';
import 'package:rob_flour_pasta_app/widgets/expandable_text.dart';
import 'package:rob_flour_pasta_app/widgets/label_text.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  List<int> listOfSliderIages = [1, 2];
  PageController pageViewController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 80.h, //set your height here
          width: double.maxFinite, //set your width here
          decoration: BoxDecoration(
              color: greenColor,
              borderRadius: BorderRadius.vertical(top: Radius.circular(0.0))),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.0.w),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    LabelText(
                      fontWeight: FontWeight.w400,
                      size: 14.58.sp,
                      color: Colors.white,
                      text: 'Total Price',
                    ),
                    LabelText(
                        fontWeight: FontWeight.w700,
                        size: 22.66.sp,
                        color: Colors.white,
                        text: '\$55.33')
                  ],
                ),
                Container(
                  decoration: const BoxDecoration(
                    color: redColor,
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: [
                        LabelText(
                            fontWeight: FontWeight.w900,
                            size: 16.sp,
                            color: Colors.white,
                            text: 'ADD TO CART'),
                        SizedBox(
                          width: 10.h,
                        ),
                        SizedBox(
                            width: 20.w,
                            height: 20.h,
                            child: Image.asset('assets/bag_icon.png'))
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30.0),
                        bottomRight: Radius.circular(30.0)),
                    color:carasoulBackground,
                  ),
                  height: 380.h,
                  child: PageView.builder(
                    controller: pageViewController,
                    itemCount: listOfSliderIages.length,
                    itemBuilder: (context, int currentIndex) {
                      return Stack(
                        children: [
                          Container(
                            child: Padding(
                              padding: const EdgeInsets.all(30.0),
                              child: Image.asset('assets/slider_image.png', fit: BoxFit.contain,),
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(30.0),
                                  bottomRight: Radius.circular(30.0)),
                              color: Colors.transparent,
                            ),
                            width: double.infinity,
                            height: 380.h,
                          ),
                          Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(
                                  // width: double.infinity,
                                  height: 20,
                                  //color: Colors.white,
                                  child: ListView.builder(
                                    shrinkWrap: true,
                                      scrollDirection: Axis.horizontal,
                                      itemCount: listOfSliderIages.length,
                                      itemBuilder: (BuildContext context, int index) {
                                        return Padding(
                                          padding: const EdgeInsets.symmetric(vertical: 8.5 ,horizontal: 2),
                                          child: Container(
                                            decoration: BoxDecoration(
                                                borderRadius:    BorderRadius.circular(50),

                                              color: currentIndex == index ? Colors.redAccent:searchHintColor,
                                            ),

                                            width:  currentIndex == index ? 20:10,
                                            height: 10,
                                          ),
                                        );
                                      }),
                                ),

                              ],
                            ),
                          ),

                        ],
                      );
                    },
                  ),
                ),
                // Positioned(
                //  // bottom: 0,
                //   child: Container(
                //     width: double.infinity,
                //     height: 20,
                //     //color: Colors.white,
                //     child: ListView.builder(
                //         scrollDirection: Axis.horizontal,
                //         itemCount: listOfSliderIages.length,
                //         itemBuilder: (BuildContext context, int index) {
                //           return Padding(
                //             padding: const EdgeInsets.all(8.0),
                //             child: Container(
                //               color: Colors.black,
                //               width:pageViewController.c ==index ? 30: 10,
                //               height: 10,
                //             ),
                //           );
                //         }),
                //   ),
                // ),
              ],
            ),
            Expanded(
              child: Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: 30.0.w, vertical: 20.0.h),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      LabelText(
                        text: "Regatoni Pasta",
                        color: greenColor,
                        fontWeight: FontWeight.w700,
                        size: 25.sp,
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      // BigText(text: 'Regatoni Pasta'),
                      Row(
                        children: [
                          Container(
                            color: greenColor,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: LabelText(
                                text: '2,123 Sold',
                                fontWeight: FontWeight.w400,
                                size: 11.sp,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Icon(Icons.star,
                              color: Colors.yellow[600], size: 18.sp),
                          SizedBox(
                            width: 5,
                          ),
                          LabelText(
                            text: '4.8(2,236 Review)',
                            fontWeight: FontWeight.w400,
                            size: 11.sp,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      LabelText(
                        text: "Description",
                        color: greenColor,
                        fontWeight: FontWeight.w700,
                        size: 25.sp,
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      SingleReview(
                          color: specialOfferColor,
                          fontWeight: FontWeight.w400,
                          size: 12.sp,
                          text:
                              "The dress is great! Very classy and comfortable. It fit perfectly! I'm 5'7 and 130 pounds. I am a 34B chest. This dress would be too long for those who are shorter but could be hemmed. I wouldn't recommend it for those big chested as I am smaller chested and it fit me perfectly. The underarms were not too wide and the dress was made well. The dress is great! Very classy and comfortable. It fit perfectly! I'm 5'7 and 130 pounds. I am a 34B chest. This dress would be too long for those who are shorter but could be hemmed. I wouldn't recommend it for those big chested as I am smaller chested and it fit me perfectly. The underarms were not too wide and the dress was made well. The dress is great! Very classy and comfortable. It fit perfectly! I'm 5'7 and 130 pounds. I am a 34B chest. This dress would be too long for those who are shorter but could be hemmed. I wouldn't recommend it for those big chested as I am smaller chested and it fit me perfectly. The underarms were not too wide and the dress was made well."),
                      SizedBox(
                        height: 30.h,
                      ),
                      Row(
                        children: [
                          LabelText(
                            text: "Quantity",
                            color: greenColor,
                            fontWeight: FontWeight.w400,
                            size: 18.sp,
                          ),
                          SizedBox(
                            width: 20.w,
                          ),
                          Container(  decoration: BoxDecoration(
                            borderRadius:    BorderRadius.circular(50),

                            color: carasoulBackground,
                          ),

                            child: Padding(
                              padding:  EdgeInsets.symmetric(horizontal: 8.0 ,vertical: 5.0),
                              child: Row(
                                children: [
                                  LabelText(
                                      color: greenColor,
                                      fontWeight: FontWeight.w700,
                                      size: 12.66.sp,
                                      text: '-'),
                                  SizedBox(
                                    width: 20.w,
                                  ),
                                  LabelText(
                                      color: greenColor,
                                      fontWeight: FontWeight.w700,
                                      size: 12.66.sp,
                                      text: '01'),
                                  SizedBox(
                                    width: 20.w,
                                  ),
                                  LabelText(
                                      color: greenColor,
                                      fontWeight: FontWeight.w700,
                                      size: 12.66.sp,
                                      text: '+'),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
