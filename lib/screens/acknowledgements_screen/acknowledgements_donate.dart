import 'package:daily_quotes/constants/colors.dart';
import 'package:daily_quotes/models/acknowledge.dart';
import 'package:flutter/material.dart';

class AcknowledgementDonate extends StatelessWidget {
  const AcknowledgementDonate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(acknowledgements1[index].Message, style: TextStyle(fontSize: 18.0),),
                      ],
                    ),),
                ],
              ),
            );
          }, itemCount: acknowledgements1.length),
    );
  }
}
