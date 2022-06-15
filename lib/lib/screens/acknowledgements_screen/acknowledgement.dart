import 'package:daily_quotes/constants/colors.dart';
import 'package:flutter/material.dart';

import 'acknowledgement_support.dart';
import 'acknowledgements_donate.dart';

class Acknowledgements extends StatelessWidget {
  const Acknowledgements({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
              onTap: (){
                Navigator.pop(context);
              },
              child: Icon(Icons.arrow_back_ios, color: Colors.black,)),
          backgroundColor: Colors.lightGreen,
          title: Text("Acknowedgements", style: TextStyle(color: Colors.black),),
          centerTitle: true,
          bottom: PreferredSize(preferredSize: Size(MediaQuery.of(context).size.width, 120.0),
          child: TabBar(tabs: [Text("Donators", style: TextStyle(fontSize: 20.0, color: Colors.black),), Text("kickstarter", style: TextStyle(fontSize: 20.0, color: Colors.black),)],),),
        ),
        body: TabBarView(children: [
          AcknowledgementDonate(),
          SupportAcknowledgement(),
        ],)
      ),
    );
  }
}
