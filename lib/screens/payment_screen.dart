import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:rob_flour_pasta_app/screens/buy_now_screen.dart';
import 'package:rob_flour_pasta_app/utils/colors.dart';
import 'package:rob_flour_pasta_app/utils/general_helper.dart';
import 'package:rob_flour_pasta_app/widgets/app_textfield.dart';
import 'package:rob_flour_pasta_app/widgets/big_text.dart';
import 'package:rob_flour_pasta_app/widgets/custom_button.dart';
import 'package:rob_flour_pasta_app/widgets/label_text.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  final TextEditingController _cardHolderNameTextController = TextEditingController();
  final TextEditingController _cardNumberTextController = TextEditingController();
  final TextEditingController _validUntilTextController = TextEditingController();
  final TextEditingController _cvvTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: LabelText(
          text: "Payment",
          fontWeight: FontWeight.bold,
        ),
        leading: GestureDetector(
            onTap: () => GeneralHelper.popBack(),
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
              size: 20.sp,
            )),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 30.h,
              ),
              Stack(
                children: [
                  Image.asset(
                    "assets/card.png",
                  ),
                  Positioned(
                      right: 80.h,
                      bottom: 86.h,
                      child: BigText(
                        text: "8014",
                        color: Colors.white,
                      )),
                  Positioned(
                      right: 235.h,
                      bottom: 20.h,
                      child: BigText(
                        text: "KELLY OLIVER",
                        color: Colors.white,
                        size: 16.sp,
                      )),
                  Positioned(
                      right: 68.h,
                      bottom: 20.h,
                      child: BigText(
                        text: "08/21",
                        color: Colors.white,
                        size: 16.sp,
                      )),
                ],
              ),
              SizedBox(
                height: 50.h,
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(20.0.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      LabelText(
                        text: "Card Holder Name",
                        size: 16.sp,
                        color: labelTextColor,
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      AppTextField(
                          textController: _cardHolderNameTextController, hintText: "Name"),
                      SizedBox(
                        height: 20.h,
                      ),
                      LabelText(
                        text: "Card Number",
                        size: 16.sp,
                        color: labelTextColor,
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      AppTextField(
                          textController: _cardNumberTextController, hintText: "Card number"),
                      SizedBox(
                        height: 20.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                LabelText(
                                  text: "Valid Until",
                                  size: 16.sp,
                                  color: labelTextColor,
                                ),
                                SizedBox(
                                  width: 10.w,
                                ),
                                AppTextField(
                                    textController: _validUntilTextController,
                                    hintText: "Expire date"),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                LabelText(
                                  text: "CVV",
                                  size: 16.sp,
                                  color: labelTextColor,
                                ),
                                SizedBox(
                                  width: 10.w,
                                ),
                                AppTextField(
                                    textController: _cvvTextController,
                                    hintText: "CVV number"),
                              ],
                            ),
                          ),
                        ],
                      ),
                      // Expanded(child: Container()),
                      SizedBox(height: 40.h,),
                      GestureDetector(
                          onTap: () {
                            Get.to(() => const BuyNowScreen());
                          },
                          child: const CustomButton(
                            text: 'save',
                          )),
                      SizedBox(
                        height: 8.h,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
