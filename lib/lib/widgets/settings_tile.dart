import 'package:daily_quotes/constants/colors.dart';
import 'package:flutter/material.dart';

class SettingTile extends StatelessWidget {
  String title;
  Widget icon;
  Function onTap;
  SettingTile({Key? key, required this.title, required this.icon, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        onTap();
      },
      child: Card(
        color: Colors.lightGreen,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14.0)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                icon,
                SizedBox(width: 10,),
                Text(title, style: TextStyle(fontSize: 18, color: Colors.black),),
                Expanded(child: SizedBox()),
                Icon(Icons.arrow_forward_ios, size: 20.0,),
              ],),
            ],
          ),
        ),
      ),
    );
  }
}
