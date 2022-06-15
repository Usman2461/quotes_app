import 'package:daily_quotes/constants/colors.dart';
import 'package:daily_quotes/widgets/cbutton.dart';
import 'package:flutter/material.dart';

class ProceedPayment extends StatelessWidget {
  const ProceedPayment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(skyBlue),
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.lightGreen, leading: Icon(Icons.arrow_back_ios, color: Colors.black,),),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 250,
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.all(16.0),
              color: Colors.lightGreen,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text("Payment Method", style: TextStyle(fontSize: 30.0, color: Colors.black),),
                  Row(children: [
                    Text("Mastercard", style: TextStyle(fontSize:18,color: Colors.black)),

                    Image(height:20, width:40, image: AssetImage("assets/images/asset13.png"),),
                    Expanded(child: SizedBox()),
                    ElevatedButton(onPressed: (){}, child: Text("Change", style: TextStyle(color: Colors.black),), style: ElevatedButton.styleFrom(primary: Color(skyBlue)),)
                  ],),
                  Row(children: [
                    Text("Card Number", style: TextStyle(fontSize:18,color: Colors.black)),
                    Expanded(child: SizedBox()),
                    Text("1234 5678 9123 4567", style: TextStyle(fontSize:18,color: Colors.black)),
                  ],),
                  Divider(thickness: 1, color: Colors.white,),
                  Row(children: [
                    Text("Card Holder", style: TextStyle(fontSize:18,color: Colors.black)),
                    Expanded(child: SizedBox()),
                    Text("Your Name", style: TextStyle(fontSize:18,color: Colors.black)),
                  ],),
                  Divider(thickness: 1, color: Colors.white,),
                  IntrinsicHeight(
                    child: Row(children: [
                      Column(
                        children: [
                          Text("Expires     22/24", style: TextStyle(fontSize:18,color: Colors.black)),
                          Divider(thickness: 1, color: Colors.white, height: 1,),
                        ],
                      ),
                      Expanded(child: SizedBox()),
                      Column(
                        children: [
                          Text("CVC       847", style: TextStyle(fontSize:18,color: Colors.black)),
                          Divider(thickness: 1, color: Colors.white, height: 1, ),
                        ],
                      ),
                    ],),
                  ),

                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(borderRadius: BorderRadius.only(topRight: Radius.circular(8.0), topLeft: Radius.circular(8.0),  )),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text("Your information"),
                  SizedBox(height: 20.0,),
                  Row(children: [
                    Text("Full Name"),
                    Expanded(child: SizedBox()),
                    Text("Your Name")
                  ],),
                  Divider(thickness: 1,),
                  Row(children: [
                    Text("Phone Number"),
                    Expanded(child: SizedBox()),
                    Text("+1(822) 868 5868")
                  ],),
                  Divider(thickness: 1,),
                  Row(children: [
                    Text("Email"),
                    Expanded(child: SizedBox()),
                    Text("youremail@gmail.com")
                  ],),
                  Divider(thickness: 1,),
                  SizedBox(height: 50.0,),
                  Row(children: [
                    Text("Total"),
                    Expanded(child: SizedBox()),
                    Text("\$11.99")
                  ],),
                  Text("1 item"),
                  SizedBox(height: 20.0,),
                  CButton(title: 'Confirm', onTap: (){
                    Navigator.pushNamed(context, "/success");
                  },),



                ],),)
          ],
        ),
      ),
    );
  }
}
