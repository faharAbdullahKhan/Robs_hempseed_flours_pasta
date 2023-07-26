import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:rob_flour_pasta_app/controller/product_cart_controller.dart';
import 'package:rob_flour_pasta_app/widgets/big_text.dart';
import 'package:rob_flour_pasta_app/widgets/label_text.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: LabelText(text: "Cart",fontWeight: FontWeight.w700,),
        leading: BigText(text: "",),
        actions: [
          Column(
            children: [
              SizedBox(height: 12.h,),
              Row(
                children: [
                  Stack(
                    children: [
                      Icon(Icons.shopping_bag_outlined, color: Colors.black,size: 30,),
                      Positioned(
                        right: 0,
                        child: Container(
                          decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white),
                          padding: EdgeInsets.all(5.r),
                          child: GetBuilder<AddToCartController>(
                              init: AddToCartController(), // intialize with the Controller

                              builder: (value) {
                                return BigText(text: value.lst.length.toString(),size: 8,);
                              }
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(width: 5.w,)
                ],
              ),
            ],
          )


        ],

      ),
    );
  }
}
