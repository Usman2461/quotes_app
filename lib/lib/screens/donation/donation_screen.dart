import 'package:daily_quotes/constants/colors.dart';
import 'package:daily_quotes/widgets/cbutton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DonationScreen extends StatelessWidget {
  const DonationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(skyBlue),
      appBar: AppBar(
        leading: GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back, color: Colors.black,)),
        title: Text("Donate", style: TextStyle(color: Colors.black),),
        centerTitle: true,
        backgroundColor: Colors.lightGreen,),
      body: SingleChildScrollView(child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
          Image(image: AssetImage("assets/images/donate.png"),),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            CircleAvatar(child: Center(child: Icon(Icons.remove)), backgroundColor: Colors.red,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Text("\$5", style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.w700),),
            ),
            CircleAvatar(child: Icon(Icons.add) , backgroundColor: Colors.lightGreen,),
          ],),
          SizedBox(height: 30.0,),
            Text("Donate to us, your donations are great support for us. Also your donation help us to be motivated", textAlign: TextAlign.center,),
            SizedBox(height: 20.0,),
            CButton(title: 'Donate', onTap: (){},),

        ],),
      ),),
    );
  }
}
