import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:rob_flour_pasta_app/controller/favorite_controller.dart';
import 'package:rob_flour_pasta_app/controller/product_cart_controller.dart';
import 'package:rob_flour_pasta_app/utils/colors.dart';
import 'package:rob_flour_pasta_app/widgets/big_text.dart';
import 'package:rob_flour_pasta_app/widgets/item_card.dart';
import 'package:rob_flour_pasta_app/widgets/label_text.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: LabelText(
          text: "Favorite",
          fontWeight: FontWeight.w700,
        ),
        leading: BigText(
          text: "",
        ),
        actions: [
          Column(
            children: [
              SizedBox(
                height: 12.h,
              ),
              Row(
                children: [
                  Stack(
                    children: [
                      Icon(
                        Icons.shopping_bag_outlined,
                        color: Colors.black,
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
                  SizedBox(
                    width: 5.w,
                  )
                ],
              ),
            ],
          )
        ],
      ),
      body: GetBuilder<FavoriteController>(
          init: FavoriteController(),
          builder: (value) {
            return value.favLst.length == 0
                ? Center(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset("assets/empty_fav.svg"),
                      ],
                    ),
                )
                : SizedBox(
                    height: MediaQuery.of(context).size.height,
                    child: GridView.builder(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.8,
                        mainAxisSpacing: 6.0,
                        crossAxisSpacing: 8.0,
                      ),
                      itemBuilder: (_, index) => ItemCard(index: index),
                      itemCount: value.favLst.length,
                    ),
                  );
          }),
    );
  }
}
