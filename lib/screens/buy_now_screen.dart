import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rob_flour_pasta_app/utils/colors.dart';
import 'package:rob_flour_pasta_app/utils/general_helper.dart';
import 'package:rob_flour_pasta_app/widgets/app_textfield.dart';
import 'package:rob_flour_pasta_app/widgets/buy_now_card.dart';
import 'package:rob_flour_pasta_app/widgets/custom_button.dart';
import 'package:rob_flour_pasta_app/widgets/label_text.dart';

class BuyNowScreen extends StatefulWidget {
  const BuyNowScreen({super.key});

  @override
  State<BuyNowScreen> createState() => _BuyNowScreenState();
}

enum SingingCharacter { cash, myPay }

class _BuyNowScreenState extends State<BuyNowScreen> {
  final TextEditingController _descriptionTextController =
      TextEditingController();

  SingingCharacter? _character = SingingCharacter.cash;

  bool cashPressed = false;
  bool myPayPressed = false;

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
      body: Padding(
        padding: const EdgeInsets.all(20.0).r,
        child: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    SvgPicture.asset("assets/location.svg"),
                    SizedBox(
                      width: 10.w,
                    ),
                    LabelText(
                      text: "Shipping Address",
                      size: 16.sp,
                      color: buyNowLabelColor,
                    ),
                    Expanded(child: Container()),
                    LabelText(
                        text: "Edit", size: 16.sp, color: buyNowLabelColor),
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                //Divider
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 8.0.w),
                  child: Container(
                    height: 1,
                    decoration: const BoxDecoration(color: dividerColor),
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.h).r,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      LabelText(
                        text: "Rayan Deck",
                        fontWeight: FontWeight.bold,
                        color: buyNowLabelColor,
                      ),
                      LabelText(
                        text: "California Street, Block 4F No.9",
                        color: buyNowLabelColor,
                        size: 16.sp,
                      ),
                      LabelText(
                        text: "San Fransisco",
                        color: buyNowLabelColor,
                        size: 16.sp,
                      ),
                      LabelText(
                        text: "California",
                        color: buyNowLabelColor,
                        size: 16.sp,
                      ),
                      LabelText(
                        text: "0214-0000-0000",
                        color: buyNowLabelColor,
                        size: 16.sp,
                      ),
                    ],
                  ),
                ),
                const BuyNowItemCard(),
                //Divider
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 8.0.w),
                  child: Container(
                    height: 1,
                    decoration: const BoxDecoration(color: dividerColor),
                  ),
                ),

                SizedBox(
                  height: 10.h,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    LabelText(
                      text: "Shipping Charges",
                      size: 14.sp,
                      fontWeight: FontWeight.w600,
                      color: buyNowLabelColor,
                    ),
                    LabelText(
                      text: "\$2",
                      size: 14.sp,
                      color: buyNowLabelColor,
                    ),
                  ],
                ),
                SizedBox(
                  height: 30.h,
                ),
                LabelText(
                  text: "Shipping Charges",
                  size: 14.sp,
                  color: buyNowLabelColor,
                ),
                SizedBox(
                  height: 10.h,
                ),

                TextField(
                  controller: _descriptionTextController,
                  maxLines: 5,
                  decoration: InputDecoration(
                    hintText: "Add message",
                    // filled: true,
                    // fillColor: textFieldBackgroundColor,
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(
                        width: 2.0,
                        color: redColor,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(
                        width: 2.0,
                        color: textFieldBackgroundColor,
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(
                        width: 2.0,
                        color: textFieldBackgroundColor,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  children: [
                    LabelText(
                      text: "Payment Method",
                      color: buyNowLabelColor,
                      fontWeight: FontWeight.bold,
                      size: 16.sp,
                    ),
                    Expanded(
                        flex: 2,
                        child: Container()),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgPicture.asset("assets/cash.svg", color: cashPressed ? redColor:buyNowLabelColor,),
                        SizedBox(
                          width: 5.w,
                        ),
                        LabelText(
                          text: "Cash",
                          color: cashPressed ? redColor:buyNowLabelColor,
                          size: 14.sp,
                        ),
                        Radio<SingingCharacter>(
                          value: SingingCharacter.cash,
                          groupValue: _character,
                          activeColor: redColor,
                          onChanged: (SingingCharacter? value) {
                            setState(() {
                              _character = value;
                              cashPressed = true;
                              myPayPressed= false;
                            });
                          },
                        ),

                        // SizedBox(
                        //   width: 5.w,
                        // ),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgPicture.asset("assets/cash.svg", color: myPayPressed ? redColor:buyNowLabelColor,),
                        SizedBox(
                          width: 5.w,
                        ),
                        LabelText(
                          text: "My Pay",
                          color: myPayPressed ? redColor:buyNowLabelColor,
                          size: 14.sp,
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        SizedBox(
                          // width: 30,
                          child: Radio<SingingCharacter>(
                            value: SingingCharacter.myPay,
                            groupValue: _character,
                            activeColor: redColor,
                            onChanged: (SingingCharacter? value) {
                              setState(() {
                                _character = value;
                                cashPressed = false;
                                myPayPressed= true;

                              });
                            },
                          ),
                        ),

                      ],
                    ),

                    // SizedBox(
                    //   width: 6.h,
                    // ),
                  ],
                ),
                //Divider
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 8.0.w),
                  child: Container(
                    height: 1,
                    decoration: const BoxDecoration(color: dividerColor),
                  ),
                ),

                SizedBox(
                  height: 15.h,
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        LabelText(text: "Subtotals for products", color: buyNowLabelColor,size: 16.sp,),
                        LabelText(text: "\$ 152", color: buyNowLabelColor,size: 16.sp,),

                      ],
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        LabelText(text: "Subtotals for products", color: buyNowLabelColor,size: 16.sp,),
                        LabelText(text: "\$ 152", color: buyNowLabelColor,size: 16.sp,),
                      ],
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        LabelText(text: "Total Payment", color: buyNowLabelColor,size: 16.sp, fontWeight: FontWeight.bold,),
                        LabelText(text: "\$ 152", color: buyNowLabelColor,size: 16.sp,fontWeight: FontWeight.bold),

                      ],
                    ),
                  ],
                ),

                Expanded(child: Container()),
              ],
            ),
          ),
        ),
      ),
      bottomSheet: Container(
        height: MediaQuery.of(context).size.height * 0.2,
        padding: EdgeInsets.all(30.r),
        decoration: BoxDecoration(color: greenColor, borderRadius: BorderRadius.only(topRight: Radius.circular(20.r), topLeft: Radius.circular(20.r))),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                LabelText(text: "Total Payment", color: Colors.white,size: 25.sp, fontWeight: FontWeight.bold,),
                LabelText(text: "\$ 152", color: Colors.white,size: 25.sp,fontWeight: FontWeight.bold),

              ],
            ),
            Expanded(child: Container()),
            const CustomButton(text: 'Buy now',),





          ],
        ),
      ),
    );
  }
}
