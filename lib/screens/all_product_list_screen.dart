import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:rob_flour_pasta_app/controller/product_cart_controller.dart';
import 'package:rob_flour_pasta_app/utils/general_helper.dart';
import 'package:rob_flour_pasta_app/widgets/big_text.dart';
import 'package:rob_flour_pasta_app/widgets/item_card.dart';
import 'package:rob_flour_pasta_app/widgets/label_text.dart';
import 'package:rob_flour_pasta_app/widgets/seaarch_text_field.dart';

class AllProductListScreen extends StatefulWidget {
  final String headingText;
  const AllProductListScreen({super.key, required this.headingText});

  @override
  State<AllProductListScreen> createState() => _AllProductListScreenState();
}

class _AllProductListScreenState extends State<AllProductListScreen> {
  final TextEditingController _searchTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: LabelText(
          text: widget.headingText,
          fontWeight: FontWeight.w700,
        ),
        leading: GestureDetector(
            onTap: () => GeneralHelper.popBack(),
            child: Icon(Icons.arrow_back_ios, color: Colors.black,size: 20.sp,)),
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
                    width: 10.w,
                  )
                ],
              ),
            ],
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(10.0.r),
        child: Column(
          children: [
            SearchTextField(
              textController: _searchTextController,
              hintText: "Search",
            ),
            Expanded(
              child: GridView.builder(
                padding: EdgeInsets.all(10),
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.8,
                  mainAxisSpacing: 6.0,
                  crossAxisSpacing: 8.0,
                ),
                itemBuilder: (_, index) => ItemCard(index: index),
                itemCount: 7,
              ),
            )
          ],
        ),
      ),
    );
  }
}
