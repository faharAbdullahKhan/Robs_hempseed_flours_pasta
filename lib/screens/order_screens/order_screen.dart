import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:rob_flour_pasta_app/controller/order_controller.dart';
import 'package:rob_flour_pasta_app/controller/product_cart_controller.dart';
import 'package:rob_flour_pasta_app/screens/order_screens/empty_order_screen.dart';
import 'package:rob_flour_pasta_app/widgets/big_text.dart';
import 'package:rob_flour_pasta_app/widgets/label_text.dart';
import 'package:rob_flour_pasta_app/widgets/order_card_widget.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: LabelText(
          text: "Order",
          fontWeight: FontWeight.w700,
        ),
        leading: BigText(
          text: "",
        ),
      ),
      body: GetBuilder<OrderController>(
        init: OrderController(),
        builder: (value){
          return value.favLst.length == 0  ? EmptyOrderScreen():ListView.builder(
              itemCount: 3,
              itemBuilder: (context, index){
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: const OrderCard(),
            );
          });
        },
      ),
    );
  }
}
