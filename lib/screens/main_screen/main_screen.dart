import 'package:clipboard/clipboard.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:daily_quotes/constants/colors.dart';
import 'package:daily_quotes/models/quotes.dart';
import 'package:daily_quotes/providers/theme_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';

import 'cdrawer.dart';

class MainScreen extends StatelessWidget {

  final Stream<QuerySnapshot> quotesStream = FirebaseFirestore.instance.collection('quotes').snapshots();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  User? user =  FirebaseAuth.instance.currentUser;
  MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context,listen: true);
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: themeProvider.isDarkMode?Colors.lightGreen:Colors.white ,
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
        child: StreamBuilder(
          stream: quotesStream,
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {

            if(snapshot.hasError){
              return Center(child: Text("Something went wrong"));
            }
            if(snapshot.connectionState == ConnectionState.waiting){
              return Center(child: CircularProgressIndicator(),);
            }

            return ListView.separated(
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  String myquotetext = snapshot.data!.docs.last.get("quote");

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
                                  Text(myquotetext, style: TextStyle(color: Color(AdarkGrey), fontSize: 30.0),),
                                  SizedBox(height: 5.0,),
                                  Text("-- ${snapshot.data!.docs.last.get("author") }",
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
                                        IconButton(onPressed: (){
                                          FlutterClipboard.copy(myquotetext);
                                          Fluttertoast.showToast(msg: "Copied");
                                        }, icon: Icon(Icons.copy_outlined)),
                                        IconButton(onPressed: () async{

                                          FirebaseFirestore.instance.collection('quotes').doc(snapshot.data!.docs.last.id).collection("Fav").doc(user?.uid).set(
                                              {"status": true});
                                        },icon:  Icon(Icons.star)),
                                        IconButton(onPressed: () async{
                                          await Share.share(myquotetext);
                                        }, icon: Icon(Icons.share_rounded)),

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
                itemCount: 1);
          }
        ),
      ),
    );
  }
}
