import 'package:daily_quotes/constants/colors.dart';
import 'package:daily_quotes/models/reminder.dart';
import 'package:daily_quotes/widgets/big_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Reminders extends StatefulWidget {

  Reminders({Key? key}) : super(key: key);

  @override
  State<Reminders> createState() => _RemindersState();
}

class _RemindersState extends State<Reminders> {
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
                          child: Icon(Icons.arrow_back_ios)), GestureDetector(
                          onTap: (){
                            Navigator.pop(context);
                          },
                          child: Text("Back",style: TextStyle(fontSize: 20.0)))],
                    ),
                    TextButton(onPressed: (){}, child: Text("Add New", style: TextStyle(color: Color(AdarkGrey), fontSize: 20.0),))
                  ],
                ),
              ))),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
          BigText(text: 'Reminders',),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0),
            child: Text("SET YOUR DAILY ROUTINE TO GET LATEST QUOTES"),
          ),
          Expanded(
            child: ListView.separated(
                shrinkWrap: true,
                itemBuilder: (context, index){
                  bool switchValue = true;
              return Card(
                color: Colors.lightGreen,
                clipBehavior: Clip.hardEdge,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                          Text("${reminders[index].startTime} - ${reminders[index].endTime}",  style: TextStyle(fontSize: 20.0),),
                          SizedBox(height: 5.0,),
                          Text("${reminders[index].days}", style: TextStyle(fontSize: 18.0),)
                        ],),
                      ),
                      Container(
                          color: Colors.black12,
                          child: Padding(
                            padding: const EdgeInsets.all(25.0),
                            child: Switch(value: switchValue, onChanged: (value){
                              switchValue = value;

                            },activeColor: Color(AdarkGrey), activeTrackColor: Colors.lightGreen ,),
                          ))
                    ],)

                  ],
                ),);
            }, separatorBuilder: (context, index){
              return SizedBox(height: 5.0,);
            }, itemCount: reminders.length),
          )
        ],),
      ),
    );
  }
}
