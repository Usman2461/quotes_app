import 'package:daily_quotes/constants/colors.dart';
import 'package:daily_quotes/models/quotes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'cdrawer.dart';

class MainScreen extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Center(child: Text("Quotes", style: TextStyle(color: Colors.black, fontSize: 24.0),)),
        elevation: 0.0,
        backgroundColor: Colors.lightGreen,
        leading: GestureDetector(
            onTap: () {},
            child: GestureDetector(
              onTap: (){
                _scaffoldKey.currentState!.openDrawer();
              },
              child: Icon(
                Icons.menu,
                color: Colors.black,
                size: 30.0,
              ),
            )),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              Icons.search,
              color: Colors.black,
              size: 30.0,
            ),
          )
        ],
      ),
      drawer: Drawer(
        child: CDrawer(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.separated(
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return  GestureDetector(
                onTap: (){
                  Navigator.pushNamed(context, "/quote");
                },
                child: Card(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
                  color: Color(skyBlue),
                  child: Padding(
                    padding: const EdgeInsets.all(0),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Text("Today's Quote", style: TextStyle(fontSize: 18.0, color: Colors.lightGreen),),
                              SizedBox(height: 14,),
                              Text(quotes[index].quote, style: TextStyle(color: Color(AdarkGrey), fontSize: 30.0),),
                              SizedBox(height: 5.0,),
                              Text("-- ${quotesmain[index].author }",
                                style: TextStyle(
                                    color: Color(AdarkGrey),
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FontStyle.italic),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  index%3==0?SizedBox():SizedBox(),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                    IconButton(onPressed: (){}, icon: Icon(Icons.copy_outlined)),
                                    IconButton(onPressed: (){}, icon: Icon(Icons.star)),
                                    IconButton(onPressed: (){}, icon: Icon(Icons.share_rounded)),

                                  ],),
                                ],
                              )
                            ],
                          ),
                    ),
                  ),
                ),
              );
            },
            separatorBuilder: (jcontext, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: Divider(),
              );
            },
            itemCount: quotesmain.length),
      ),
    );
  }
}
