import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:rob_flour_pasta_app/controller/product_cart_controller.dart';
import 'package:rob_flour_pasta_app/screens/all_product_list_screen.dart';
import 'package:rob_flour_pasta_app/screens/cart_screen.dart';
import 'package:rob_flour_pasta_app/screens/product_detail_screen/product_details_page.dart';
import 'package:rob_flour_pasta_app/utils/colors.dart';
import 'package:rob_flour_pasta_app/widgets/big_text.dart';
import 'package:rob_flour_pasta_app/widgets/item_card.dart';
import 'package:rob_flour_pasta_app/widgets/label_text.dart';
import 'package:rob_flour_pasta_app/widgets/swipe_delete.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void navigateToSeeAllScreen(String headingText) {
    Get.to(
        () => AllProductListScreen(
              headingText: headingText,
            ),
        transition: Transition.cupertino);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.0.w),
          child: Column(
            children: [
              SizedBox(
                height: 30.h,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(18.r),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.r),
                        color: searchFieldBackgroundColor,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 3,
                            spreadRadius: 1,
                            offset: const Offset(1, 4),
                            color: Colors.grey.withOpacity(0.2),
                          )
                        ],
                      ),
                      child: Row(
                        children: [
                          SvgPicture.asset("assets/search.svg"),
                          SizedBox(
                            width: 10.w,
                          ),
                          BigText(
                            text: "Search",
                            color: searchHintColor,
                            size: 16.sp,
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.to(() => CartScreen());
                    },
                    child: Container(
                      padding: EdgeInsets.all(10.r),
                      decoration: BoxDecoration(
                          color: redColor,
                          borderRadius: BorderRadius.circular(10.r)),
                      child: Stack(
                        children: [
                          Icon(
                            Icons.shopping_bag_outlined,
                            color: Colors.white,
                            size: 30,
                          ),
                          Positioned(
                            right: 0,
                            child: Container(
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle, color: Colors.white),
                              padding: EdgeInsets.all(5.r),
                              child: GetBuilder<AddToCartController>(
                                  init:
                                      AddToCartController(), // intialize with the Controller

                                  builder: (value) {
                                    return BigText(
                                      text: value.lst.length.toString(),
                                      size: 8,
                                    );
                                  }),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                  // SvgPicture.asset("assets/filter.svg")
                ],
              ),
              // SizedBox(
              //   height: 30.h,
              // ),
              Expanded(
                flex: 9,
                child: ListView(
                  // padding: EdgeInsets.zero,
                  children: [
                    SizedBox(
                      height: 30.h,
                    ),
                    Row(
                      // crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        LabelText(
                          text: "Special Offers",
                          color: specialOfferColor,
                          size: 18.sp,
                        ),
                        GestureDetector(
                          onTap: () {
                            navigateToSeeAllScreen("Special Offers");
                          },
                          child: LabelText(
                            text: "See all",
                            color: specialOfferColor,
                            size: 14.sp,
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    SvgPicture.asset("assets/banner.svg"),
                    SizedBox(
                      height: 10.h,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.all(20.r),
                      decoration: BoxDecoration(
                        color: greenColor,
                        borderRadius: BorderRadius.circular(16.r),
                      ),
                      child: LabelText(
                        text: "Company About",
                        color: Colors.white,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Row(
                      // crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        LabelText(
                          text: "Sale Discount",
                          color: specialOfferColor,
                          size: 18.sp,
                        ),
                        GestureDetector(
                          onTap: () {
                            navigateToSeeAllScreen("Sale Discount");
                          },
                          child: LabelText(
                            text: "See all",
                            color: specialOfferColor,
                            size: 14.sp,
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    GridView.builder(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.8,
                        mainAxisSpacing: 6.0,
                        crossAxisSpacing: 8.0,
                      ),
                      itemBuilder: (_, index) => GestureDetector(
                          onTap: () {
                            Get.to(() => ProductDetailsScreen(index: index));
                          },
                          child: ItemCard(
                            index: index,
                          )),
                      itemCount: 2,
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Row(
                      // crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        LabelText(
                          text: "Most Popular",
                          color: specialOfferColor,
                          size: 18.sp,
                        ),
                        GestureDetector(
                          onTap: () {
                            navigateToSeeAllScreen("Most Popular");
                          },
                          child: LabelText(
                            text: "See all",
                            color: specialOfferColor,
                            size: 12.sp,
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    GridView.builder(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.8,
                        mainAxisSpacing: 6.0,
                        crossAxisSpacing: 8.0,
                      ),
                      itemBuilder: (_, index) => GestureDetector(
                          onTap: () {
                            Get.to(() => ProductDetailsScreen(
                                  index: index,
                                ));
                          },
                          child: ItemCard(
                            index: index,
                          )),
                      itemCount: 2,
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Row(
                      // crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        LabelText(
                          text: "Most Popular",
                          color: specialOfferColor,
                          size: 18.sp,
                        ),
                        GestureDetector(
                          onTap: () {
                            navigateToSeeAllScreen("Most Popular");
                          },
                          child: LabelText(
                            text: "See all",
                            color: specialOfferColor,
                            size: 12.sp,
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    GridView.builder(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.8,
                        mainAxisSpacing: 6.0,
                        crossAxisSpacing: 8.0,
                      ),
                      itemBuilder: (_, index) => ItemCard(
                        index: index,
                      ),
                      itemCount: 2,
                    )
                  ],
                ),
              )

              // Expanded(
              //   child: ListView.builder(
              //       itemCount: 2,
              //       shrinkWrap: true,
              //       scrollDirection: Axis.horizontal,
              //       itemBuilder: (context, index){
              //         return ItemCard();
              //   }),
              // ),
              // Expanded(child: Container()),
            ],
          ),
        ),
      ),
    );
  }
}
