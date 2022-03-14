import 'package:daily_quotes/constants/colors.dart';
import 'package:flutter/material.dart';
class BigText extends StatelessWidget {
  String text;
  TextAlign alignment;
  BigText({Key? key, required this.text, this.alignment = TextAlign.start}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: alignment,
      style: TextStyle(color:Color(AdarkGrey),fontSize: 30, fontWeight: FontWeight.w600),
    );
  }
}
