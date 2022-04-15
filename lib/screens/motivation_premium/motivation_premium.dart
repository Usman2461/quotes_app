import 'package:daily_quotes/animations/custom_page_route2.dart';
import 'package:daily_quotes/constants/colors.dart';
import 'package:daily_quotes/screens/main_screen/main_screen.dart';
import 'package:daily_quotes/widgets/cbutton.dart';
import 'package:daily_quotes/widgets/feature_tile.dart';
import 'package:daily_quotes/widgets/progress_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class MotivationPremium extends StatelessWidget {
  const MotivationPremium({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreen,
      persistentFooterButtons: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
          Text("Restore"),
          Text("Terms and Conditions"),
          Text("Other Options"),
        ],)
      ],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        centerTitle: true,
        title: Text("Daily Quotes Premium", style: TextStyle(color: Color(AdarkGrey)),),
        leading: Icon(Icons.arrow_back_ios, color: Color(AdarkGrey),)),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Center(
                    child: Image(
                      height: 80,
                      width: 80,
                      image: AssetImage("assets/images/applogo.png"),
                    ),
                  ),
                  SizedBox(height: 20.0,),
                  Center(
                    child: Text(
                      "Unlock everything",
                      style: TextStyle(fontSize: 30.0),
                    ),
                  ),
                  FeatureTile(text: "Currently free but with ads", style: TextStyle(fontSize: 18.0)),
                  FeatureTile(text: "Remove ads with premium version", style: TextStyle(fontSize: 18.0)),
                  FeatureTile(text: "Only \$0.99/month , billed annually", style: TextStyle(fontSize: 18.0)),

                  SizedBox(height: 10,),
                  Center(child: Text("Just \$11.99/year", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24.0),)),
                  SizedBox(height: 20.0,),
                  CButton(title: 'Buy Now', color:Color(skyBlue), onTap: (){
                    Navigator.pushNamed(context, "/check-out");
                  },),
                  TextButton(onPressed: () async{
                    try {
                      showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (BuildContext context)
                          {
                            return ProgressDialog(message: "Just a moment. We are preparing...",);
                          }
                      );
                      UserCredential user = await FirebaseAuth.instance.signInAnonymously();
                      if(user!=null){
                        Navigator.of(context).push(CustomPageRoute2(child:MainScreen(), begin: Offset(1,0)) );
                      }
                      else{
                        Fluttertoast.showToast(msg: "Unable to fetch data from server");
                      }

                    } on FirebaseAuthException catch  (e) {
                      print('Failed to continue: ${e.code}');
                      print(e.message);
                      Fluttertoast.showToast(msg: "Unable to fetch data from server");
                    }

                  },
                  child: Text("Proceed to basic (free version)", style: TextStyle(color: Colors.black),),),
                  SizedBox(height: 20.0,),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
