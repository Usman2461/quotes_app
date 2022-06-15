import 'package:daily_quotes/constants/colors.dart';
import 'package:daily_quotes/models/acknowledge.dart';
import 'package:flutter/material.dart';
class SupportAcknowledgement extends StatelessWidget {
  const SupportAcknowledgement({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
      return Container(
        color: Color(skyBlue),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
                "I would like to thank the developers of the app.\n\n"
                "I would also like to extend my sincere thanks to kickstarter backers:\n",

            style: TextStyle(fontSize: 20.0),
            ),
            ListView.builder(
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
                              Text(acknowledgements2[index].Message, style: TextStyle(fontSize: 18.0),),
                            ],
                          ),),
                      ],
                    ),
                  );
                }, itemCount: acknowledgements1.length),
          ],
        ),
      ),
    );
  }
}
