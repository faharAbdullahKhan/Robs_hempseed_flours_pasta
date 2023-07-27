import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rob_flour_pasta_app/widgets/label_text.dart';

class SingleReview extends StatefulWidget {
  Color? color;
  final String text;
  double size;
  TextOverflow overflow;
  FontWeight fontWeight;
  TextDecoration textDecoration;
  SingleReview(
      {Key? key,
      this.color = const Color(0xFF332b2b),
      required this.text,
      this.overflow = TextOverflow.ellipsis,
      this.fontWeight = FontWeight.normal,
      this.size = 0,
      this.textDecoration = TextDecoration.underline})
      : super(key: key);

  @override
  State<SingleReview> createState() => _SingleReviewState();
}

class _SingleReviewState extends State<SingleReview> {
  bool reveal = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 0.0,
        vertical: 10,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              setState(() {
                reveal = !reveal;
              });
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                LabelText(text: widget.text, size: 12.sp,maxLines: reveal ? 4 : 500),
                reveal == false
                    ? Text(
                        'View less',
                        style: TextStyle(
                          fontFamily: "AVGARDN_2",
                          color: widget.color,
                          fontWeight: FontWeight.w900,
                          decoration: TextDecoration.underline,
                          fontSize: widget.size == 0
                              ? MediaQuery.of(context).size.height / 42.2
                              : widget.size,
                        ),
                      )
                    : Text(
                        'View More',
                        style: TextStyle(
                          fontFamily: "AVGARDN_2",
                          color: widget.color,
                          fontWeight: FontWeight.w900,
                          decoration: TextDecoration.underline,
                          fontSize: widget.size == 0
                              ? MediaQuery.of(context).size.height / 42.2
                              : widget.size,
                        ),
                      )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
