import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rob_flour_pasta_app/widgets/label_text.dart';

class CartBottomSheet extends StatefulWidget {
  final String labelText;
  final String priceText;
  const CartBottomSheet(
      {super.key, required this.labelText, required this.priceText});

  @override
  State<CartBottomSheet> createState() => _CartBottomSheetState();
}

class _CartBottomSheetState extends State<CartBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        LabelText(text: widget.labelText, color: Colors.white, size: 16.sp),
        LabelText(
          text: widget.priceText,
          color: Colors.white,
          size: 16.sp,
          fontWeight: FontWeight.bold,
        ),
      ],
    );
  }
}
