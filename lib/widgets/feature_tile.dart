import 'package:daily_quotes/constants/colors.dart';
import 'package:flutter/material.dart';

class FeatureTile extends StatelessWidget {
  String text;
  TextStyle style;
  FeatureTile({Key? key, required this.text, required this.style}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return    Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          CircleAvatar(
            radius: 14,
            child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: CircleAvatar(
                  radius: 12.0,
                  backgroundColor: Color(skyBlue), child: Icon(Icons.done, size: 20.0,)),
            ),
          ),
          SizedBox(width: 10,),
          Text(text, style: style,)
        ],
      ),
    );
  }
}
