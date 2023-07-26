import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:rob_flour_pasta_app/controller/favorite_controller.dart';
import 'package:rob_flour_pasta_app/controller/product_cart_controller.dart';
import 'package:rob_flour_pasta_app/utils/colors.dart';
import 'package:rob_flour_pasta_app/widgets/label_text.dart';

class ItemCard extends StatefulWidget {
  final int index;
  const ItemCard({super.key, required this.index});

  @override
  State<ItemCard> createState() => _ItemCardState();
}

class _ItemCardState extends State<ItemCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(color: textFieldBackgroundColor,
      borderRadius: BorderRadius.circular(20.r)

      ),
      child: Column(
        children: [
          SizedBox(height: 10.h,),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
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
              ),
              SizedBox(width: 10.w,)
            ],
          ),

          Expanded(child: Image.asset("assets/item.png")),

          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      LabelText(text: "Best seller",color: redColor,size: 16.sp,),
                      SizedBox(height: 5.h,),
                      LabelText(text: "Most popular",color: specialOfferColor,),
                      SizedBox(height: 3.h,),
                      LabelText(text: "\$50.99", color: specialOfferColor,size: 18.sp,),

                    ],
                  ),
                ),
                Expanded(child: Container()),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GetBuilder<AddToCartController>(
                        init: AddToCartController(),
                        builder: (value) => GestureDetector(
                            onTap: (){
                              int added = 0;
                              added++;
                              value.add("Best seller", "assets/item.png", added);
                            },
                            child: SvgPicture.asset("assets/add.svg",height: 40.h,))),
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
