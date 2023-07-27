import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

class LabelText extends StatelessWidget {
  Color? color;
  final String text;
  double size;
  TextOverflow overflow;
  FontWeight fontWeight;
  int maxLines;
  TextDecoration textDecoration;

  LabelText(
      {Key? key,
        this.color = const Color(0xFF332b2b),
        required this.text,
        this.overflow = TextOverflow.ellipsis,
        this.fontWeight = FontWeight.normal,
        this.size = 0,
        this.textDecoration =TextDecoration.none,
      this.maxLines = 500})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLines,
      overflow: overflow,
      style: TextStyle(
        fontFamily: "AVGARDN_2",
        color: color,
        fontWeight: fontWeight,
        decoration: textDecoration,
        fontSize: size == 0 ? MediaQuery.of(context).size.height / 42.2 : size,
      ),
    );
  }
}
