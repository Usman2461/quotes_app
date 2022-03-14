import 'package:daily_quotes/constants/colors.dart';
import 'package:daily_quotes/widgets/big_text.dart';
import 'package:daily_quotes/widgets/cbutton.dart';
import 'package:flutter/material.dart';

class AddQuote extends StatelessWidget {
  const AddQuote({Key? key}) : super(key: key);

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

                    CButton(title: 'Submit a Quote', onTap: (){},)
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
                text: "Submitted",
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12.0),
                child: TextField(
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Color(lightGrey),
                      hintText: "Search",
                      prefixIcon: Icon(Icons.search),
                      border: UnderlineInputBorder(borderSide: BorderSide.none, borderRadius: BorderRadius.circular(8.0))
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Image(height:220, width:220, image: AssetImage("assets/images/submitit.png"),),
              ),
              Center(child: BigText(text: "You haven't submitted anything yet.", alignment: TextAlign.center,)),

            ],
          ),
        ),
      ),
    );
  }
}
