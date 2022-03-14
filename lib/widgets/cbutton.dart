import 'package:daily_quotes/constants/colors.dart';
import 'package:flutter/material.dart';
class CButton extends StatelessWidget {
  String title;
  Function onTap;
  Color color;
  int textColor;
  CButton({Key? key, required this.title, required this.onTap, this.color = Colors.lightGreen, this.textColor = AdarkGrey}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   ElevatedButton(
        style: ElevatedButton.styleFrom(primary: color, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0))),
        onPressed: (){
          onTap();
        }, child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(title, style: TextStyle(color: Colors.black, fontSize: 18.0),),
    ));
  }
}
