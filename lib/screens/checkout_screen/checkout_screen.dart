import 'package:daily_quotes/constants/colors.dart';
import 'package:daily_quotes/widgets/cbutton.dart';
import 'package:flutter/material.dart';

class CheckOut extends StatelessWidget {
  const CheckOut({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(skyBlue),
      appBar: AppBar(
        title: Text("Purchase", style: TextStyle(color: Colors.black),),
        centerTitle: true,
        backgroundColor: Colors.lightGreen,
        elevation: 0.0,
        leading: GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back_ios, color: Colors.black,)),),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [

                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    "Review Purchase",
                    style: TextStyle(fontSize: 30.0,),
                  ),
                ),
                Text("Date & Time"),
                Row(
                  children: [
                    Text("Monday, January 24"),
                    Expanded(child: SizedBox()),
                  ],
                ),
                Text("10:00 AM"),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Divider(
                    thickness: 1,
                  ),
                ),

                Row(
                  children: [
                    Text("Annual Package"),
                    Expanded(child: SizedBox()),
                  ],
                ),
                Text("Premium - No Advertisements"),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Divider(
                    thickness: 1,
                  ),
                ),
                Text("Payment Method"),
                Row(
                  children: [
                    Card(child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image(height:20, width:40, image: AssetImage("assets/images/asset13.png"),),
                    )),
                    Card(child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image(height:20, width:40, image: AssetImage("assets/images/asset14.png"),),
                    )),
                    Card(child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image(height:20, width:40, image: AssetImage("assets/images/paypal.png"),),
                    )),
                    Card(child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image(height:20, width:40, image: AssetImage("assets/images/americanexpress.png"),),
                    )),
                    Card(child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image(height:20, width:40, image: AssetImage("assets/images/bitcoin.png"),),
                    )),
                    Expanded(child: SizedBox()),
                    Icon(Icons.arrow_forward_ios)
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Divider(
                    thickness: 1,
                  ),
                ),
                Text("Price"),
                SizedBox(height: 8.0,),
                Text("\$0.99/month", style: TextStyle(fontSize: 16.0),),
                SizedBox(height: 8.0,),
                Row(children: [
                  Text("\$11.99 /Year"),
                  Expanded(child: SizedBox()),
                ],),
                SizedBox(height: 20.0,),
                Row(children: [
                  Text("Total"),
                  Expanded(child: SizedBox()),
                  Text("\$11.99", style: TextStyle(fontSize: 18.0),),
                ],),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12.0),
                  child: CButton(title: 'Confirm', onTap: (){
                    Navigator.pushNamed(context, "/payment");
                  },),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
