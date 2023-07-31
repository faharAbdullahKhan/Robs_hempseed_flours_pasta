import 'package:carousel_slider/carousel_slider.dart';
import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rob_flour_pasta_app/controller/favorite_controller.dart';
import 'package:rob_flour_pasta_app/screens/cart_screens/cart_screen.dart';
import 'package:rob_flour_pasta_app/screens/product_detail_screen/products_details_slider.dart';
import 'package:rob_flour_pasta_app/screens/rating_Screen/rating_and_reviews.dart';
import 'package:rob_flour_pasta_app/utils/colors.dart';
import 'package:rob_flour_pasta_app/widgets/big_text.dart';
import 'package:rob_flour_pasta_app/widgets/expandable_text.dart';
import 'package:rob_flour_pasta_app/widgets/label_text.dart';
import 'package:get/get.dart';

class ProductDetailsScreen extends StatefulWidget {
  final int index;
  const ProductDetailsScreen({super.key, required this.index});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {

  int _count=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: BottomAppBar(
        elevation: 0,
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
                GestureDetector(
                  onTap: () {

                    Get.to(CartScreen());
                  } ,
                  child: Container(
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
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            decoration:const BoxDecoration(color: carasoulBackground),
            child: SafeArea(
              child: Stack(
                children: [
                  Stack(
                    children: [
                      const productsDetailsSlider(),
                      Positioned(
                          top: 20,
                          right: 20,
                          child:    Container(
                            padding: EdgeInsets.all(5.r),
                            decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white),
                            child: GetBuilder<FavoriteController>(
                                init: FavoriteController(),
                                builder: (value) {
                                  return FavoriteButton(
                                    iconSize: 5,
                                    valueChanged: (isFavorite) {
                                      print('Is Favorite $isFavorite)');
                                      int added = 0;
                                      added++;
                                      value.add("Best seller", "assets/item.png", added);

                                      if(isFavorite == false) {
                                        value.del(widget.index);
                                      }
                                    },
                                    // child: Icon(Icons.favorite_border),
                                  );
                                }
                            ),
                          ),),
                      Positioned(
                          top: 20,
                          left: 20,
                          child: GestureDetector(
                            onTap: () {

                              Get.back();

                            },
                            child: Icon(
                              Icons.arrow_back_ios,
                              size: 20.w,
                            ),
                          )),
                    ],
                  ),
                ],
              ),
            ),
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
                        GestureDetector(
                          onTap: () {
                            Get.to(ratingAndReviews());
                          },
                          child: Row(
                            children: [
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
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: carasoulBackground,
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 8.0, vertical: 5.0),
                            child: Row(
                              children: [
                                // LabelText(
                                //     color: greenColor,
                                //     fontWeight: FontWeight.w700,
                                //     size: 12.66.sp,
                                //     text: '-'),

                                GestureDetector(
                                  onTap: () {

                                    setState(() {
                                      if(_count > 0 )
                                        {
                                          _count--;

                                        }

                                    });

                                  },
                                  child: Icon(
                                    Icons.remove,
                                    size: 15.66.sp,
                                    color: greenColor,
                                  ),
                                ),
                                SizedBox(
                                  width: 10.w,
                                ),
                                LabelText(
                                    color: greenColor,
                                    fontWeight: FontWeight.w700,
                                    size: 12.66.sp,
                                    text: _count.toString()),
                                SizedBox(
                                  width: 10.w,
                                ),
                                // LabelText(
                                //     color: greenColor,
                                //     fontWeight: FontWeight.w700,
                                //     size: 12.66.sp,
                                //     text: '+'),
                                GestureDetector(
                                  onTap: () {

                                    setState(() {
                                      _count++;
                                    });

                                  },
                                  child: Icon(
                                    Icons.add,
                                    size: 15.66.sp,
                                    color: greenColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 150.h,)

                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
