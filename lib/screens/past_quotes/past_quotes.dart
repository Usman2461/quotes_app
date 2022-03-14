import 'package:daily_quotes/constants/colors.dart';
import 'package:daily_quotes/models/quotes.dart';
import 'package:daily_quotes/widgets/big_text.dart';
import 'package:daily_quotes/widgets/cbutton.dart';
import 'package:flutter/material.dart';

class PastQuotes extends StatelessWidget {
  const PastQuotes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.lightGreen,

     appBar: PreferredSize(
          preferredSize: Size(MediaQuery.of(context).size.width, 200.0),
          child: Container(
            color: Color(skyBlue),
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
                            child: Text("Back"))],
                      ),

                      Icon(Icons.search,size: 24.0,),
                    ],
                  ),
                )),
          )),
      body: Column(children: [
        BigText(text: "Past Quotes"),
        SizedBox(height: 10,),
        Expanded(
          child: ListView.builder(
              shrinkWrap: true,
              itemBuilder: (context, index){
            return Container(
              color: index%2==0?Color(skyBlue):Colors.lightGreen,
              child: Row(
                children: [
                  Container(
                    width:MediaQuery.of(context).size.width-40,
                    padding: EdgeInsets.all(16.0),
                    child: Text(quotes[index].quote),),
                  Icon(Icons.more_vert_outlined)
                ],
              ),
            );
          }, itemCount: quotes.length),
        )

      ],),
    );
  }
}
