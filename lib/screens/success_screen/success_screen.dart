import 'package:daily_quotes/constants/colors.dart';
import 'package:flutter/material.dart';
class SuccessScreen extends StatelessWidget {
  const SuccessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(skyBlue),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(16.0),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
          CircleAvatar(
            backgroundColor: Colors.lightGreen,
            radius: 50.0,
            child: Icon(Icons.done, size: 50.0, color: Colors.white,),),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text("You payment is done successfully", style: TextStyle(fontSize: 20.0),),
          ),
          Text("Thank you for the payment. We will forward the reciept to you through the email", textAlign: TextAlign.center,)
          
        ],),),
      ),
    );
  }
}
