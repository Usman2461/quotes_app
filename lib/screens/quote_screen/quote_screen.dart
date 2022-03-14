import 'package:daily_quotes/constants/colors.dart';
import 'package:flutter/material.dart';

class QuoteScreen extends StatelessWidget {
  const QuoteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(skyBlue),
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
                          child: Icon(Icons.arrow_back_ios, color: Colors.black,)), GestureDetector(
                          onTap: (){
                            Navigator.pop(context);
                          },
                          child: Text("Back", style: TextStyle(color: Colors.black),))],
                    ),

                    TextButton(onPressed: (){}, child: Row(
                      children: [
                        Icon(Icons.lock_rounded, color: Color(0xffe3cf28),),
                        SizedBox(width: 5.0,),
                        Text("Go Premium", style: TextStyle(color: Color(0xffe3cf28)),),
                      ],
                    ))
                  ],
                ),
              ))),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "At the end of the day, tell yourself a gently, 'I love you, "
                "You did the best you could today, and even if you didn't accomplished all you had planned, I love you anyway.",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 30.0, color: Colors.black),
              ),
              SizedBox(
                height: 20,
              ),
              Divider(thickness: 1,color: Color(lightGrey),),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(onPressed: (){}, icon:Icon(
                    Icons.copy_outlined,
                    color: Colors.black,
                    size:40.0,
                  ),),
                  SizedBox(
                    width: 15,
                  ),
                  IconButton(onPressed: (){}, icon:Icon(
                    Icons.star,
                    color: Colors.orangeAccent,
                    size: 40.0,
                  ),),

                  SizedBox(
                    width: 15,
                  ),
                  IconButton(onPressed: (){}, icon:Icon(
                    Icons.share,
                    color: Colors.black,
                    size: 40.0,
                  ),),

                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
