import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rob_flour_pasta_app/utils/colors.dart';
import 'package:rob_flour_pasta_app/widgets/big_text.dart';
import 'package:rob_flour_pasta_app/widgets/item_card.dart';
import 'package:rob_flour_pasta_app/widgets/label_text.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.0.w),
          child: Column(
            children: [
              // Expanded(child: Container()),
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(6.r),
                    width: 50,
                    height: 50,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: greenColor),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(100.r),
                        child: Image.network(
                            fit: BoxFit.cover,
                            "https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=987&q=80")),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BigText(
                        text: "Rayan deck",
                        size: 18.sp,
                        fontWeight: FontWeight.bold,
                      ),
                      BigText(
                        text: "Rayan deck04@gmail.com",
                        size: 14.sp,
                        fontWeight: FontWeight.w300,
                      ),
                    ],
                  ),
                  Expanded(child: Container()),
                  Row(
                    children: [
                      SvgPicture.asset("assets/message.svg"),
                      SizedBox(
                        width: 16.w,
                      ),
                      SvgPicture.asset("assets/call.svg"),
                      SizedBox(
                        width: 16.w,
                      ),
                      SvgPicture.asset("assets/cart_icon.svg"),
                      SizedBox(
                        width: 10.w,
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 30.h,
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(15.r),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                        color: searchFieldBackgroundColor,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 3,
                            spreadRadius: 1,
                            offset: const Offset(1, 10),
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
                  SvgPicture.asset("assets/filter.svg")
                ],
              ),
              SizedBox(
                height: 30.h,
              ),
             Expanded(
               flex: 9,
               child: SingleChildScrollView(
                 child: Column(
                   children: [
                     Row(
                       // crossAxisAlignment: CrossAxisAlignment.end,
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: [
                         LabelText(
                           text: "Special Offers",
                           color: specialOfferColor,
                           size: 18.sp,
                         ),
                         LabelText(
                           text: "See all",
                           color: specialOfferColor,
                           size: 12.sp,
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
                       child: LabelText(text: "Company About",color: Colors.white,fontWeight: FontWeight.w800,),
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
                         LabelText(
                           text: "See all",
                           color: specialOfferColor,
                           size: 12.sp,
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
                       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount( crossAxisCount: 2,
                         childAspectRatio: 0.8,
                         mainAxisSpacing: 6.0,
                         crossAxisSpacing: 8.0,),
                       itemBuilder: (_, index) => ItemCard(),
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
                         LabelText(
                           text: "See all",
                           color: specialOfferColor,
                           size: 12.sp,
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
                       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount( crossAxisCount: 2,
                         childAspectRatio: 0.8,
                         mainAxisSpacing: 6.0,
                         crossAxisSpacing: 8.0,),
                       itemBuilder: (_, index) => ItemCard(),
                       itemCount: 2,
                     )
                   ],
                 ),
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
