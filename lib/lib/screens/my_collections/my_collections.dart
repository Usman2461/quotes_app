import 'package:daily_quotes/constants/colors.dart';
import 'package:daily_quotes/widgets/big_text.dart';
import 'package:daily_quotes/widgets/cbutton.dart';
import 'package:flutter/material.dart';

class Collections extends StatelessWidget {
  const Collections({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(skyBlue),
      persistentFooterButtons: [

      ],
      appBar: PreferredSize(
          preferredSize: Size(MediaQuery.of(context).size.width, 200.0),
          child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [GestureDetector(
                          onTap: (){
                            Navigator.pop(context);
                          },
                          child: Icon(Icons.arrow_back_ios)), GestureDetector(
                          onTap: (){
                            Navigator.pop(context);
                          },
                          child: Text("Daily Quotes"))],
                    ),

                    CButton(title: 'Create Group', onTap: (){},)
                  ],
                ),
              ))),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              BigText(
                text: "My Groups",
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Image(height:200, width:200, image: AssetImage("assets/images/meetings.png"),),
              ),
              Center(child: BigText(text: "You don't have any groups yet.", alignment: TextAlign.center,)),
              SizedBox(height: 10,),
              Center(
                  child: Text("Groups allows you to categorize quotes according to your preferences",
                    textAlign: TextAlign.center,
                  )),

            ],
          ),
        ),
      ),
    );
  }
}
