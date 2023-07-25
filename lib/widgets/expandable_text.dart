import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
      this.textDecoration = TextDecoration.none})
      : super(key: key);

  @override
  State<SingleReview> createState() => _SingleReviewState();
}

class _SingleReviewState extends State<SingleReview> {
  bool reveal = false;

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
              children: [
                Text(
                  style: TextStyle(
                    fontFamily: "AVGARDN_2",
                    color: widget.color,
                    fontWeight: widget.fontWeight,
                    decoration: widget.textDecoration,
                    fontSize: widget.size == 0
                        ? MediaQuery.of(context).size.height / 42.2
                        : widget.size,
                  ),
                  widget.text,
                  maxLines: reveal ? 4 : null,
                  overflow: reveal ? TextOverflow.ellipsis : null,
                ),
                reveal == false
                    ? Text(
                        'View More',
                        style: TextStyle(
                          fontFamily: "AVGARDN_2",
                          color: widget.color,
                          fontWeight:FontWeight.w900,
                          decoration: widget.textDecoration,
                          fontSize: widget.size == 0
                              ? MediaQuery.of(context).size.height / 42.2
                              : widget.size,
                        ),
                      )
                    : Text(
                        'VIew less',
                        style: TextStyle(
                          fontFamily: "AVGARDN_2",
                          color: widget.color,
                          fontWeight: FontWeight.w900,
                          decoration: widget.textDecoration,
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
