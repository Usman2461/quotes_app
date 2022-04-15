import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:daily_quotes/constants/colors.dart';
import 'package:daily_quotes/models/quotes.dart';
import 'package:daily_quotes/widgets/big_text.dart';
import 'package:daily_quotes/widgets/cbutton.dart';
import 'package:flutter/material.dart';

class PastQuotes extends StatelessWidget {
   PastQuotes({Key? key}) : super(key: key);
  final Stream<QuerySnapshot> quotesStream = FirebaseFirestore.instance.collection('quotes').snapshots();
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
          child: StreamBuilder(
            stream: quotesStream,
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if(snapshot.hasError){
                return Center(child: Text("Something went wrong"));
              }
              if(snapshot.connectionState == ConnectionState.waiting){
                return Center(child: CircularProgressIndicator(),);
              }
              return ListView.builder(
                  shrinkWrap: true,
                  itemBuilder: (context, index){
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    padding: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: index%2==0?Color(skyBlue):Colors.green,
                    ),

                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(snapshot.data!.docs[index].get("quote")),
                              Text(snapshot.data!.docs[index].get("author")),
                            ],
                          ),),
                        Icon(Icons.copy)
                      ],
                    ),
                  ),
                );
              }, itemCount: snapshot.data!.docs.length-1);
            }
          ),
        )

      ],),
    );
  }
}
