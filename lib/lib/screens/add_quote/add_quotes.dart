import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:daily_quotes/constants/colors.dart';
import 'package:daily_quotes/models/quotes.dart';
import 'package:daily_quotes/services/firebase_service.dart';
import 'package:daily_quotes/widgets/big_text.dart';
import 'package:daily_quotes/widgets/cbutton.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class AddQuote extends StatelessWidget {
  AddQuote({Key? key}) : super(key: key);
  TextEditingController quoteController = TextEditingController();
  TextEditingController authorController = TextEditingController();
  final Stream<QuerySnapshot> quotesStream = FirebaseFirestore.instance.collection('quotes').snapshots();
  @override
  Widget build(BuildContext context) {
    FirebaseService firebaseService =
        Provider.of<FirebaseService>(context, listen: false);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(skyBlue),
      persistentFooterButtons: [],
      appBar: PreferredSize(
          preferredSize: Size(MediaQuery.of(context).size.width, 200.0),
          child: SafeArea(
              child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(Icons.arrow_back_ios)),
                    GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Text("Daily Quotes"))
                  ],
                ),
                CButton(
                  title: 'Submit a Quote',
                  onTap: () async {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return postQuoteDialog(context, firebaseService);
                        });

                  },
                ),
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
                text: "My Quotes",
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12.0),
                child: TextField(
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Color(lightGrey),
                      hintText: "Search",
                      prefixIcon: Icon(Icons.search),
                      border: UnderlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(8.0))),
                ),
              ),
              StreamBuilder(
                  stream: quotesStream,
                  builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {

                    print("this is adata ${snapshot.data!.docs.length}");
                    if(snapshot.hasError){
                      return Center(child: Text("Something went wrong"));
                    }
                    if(snapshot.connectionState == ConnectionState.waiting){
                      return Center(child: CircularProgressIndicator(),);
                    }
                 List<QueryDocumentSnapshot> myDocs =   snapshot.data!.docs.where((element) => element.get("submitby")==FirebaseAuth.instance.currentUser!.uid).toList();
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
                                          Text(myDocs[index].get("quote")),
                                          Text(myDocs[index].get("author")),
                                        ],
                                      ),),
                                    Icon(Icons.copy)
                                  ],
                                ),
                              ),
                            );
                          }, itemCount: myDocs.length);
                  }
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget postQuoteDialog(context, FirebaseService firebaseService) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        child: SizedBox(
            height: 400,
            child: AlertDialog(title:Text("Post Quote"),
              actions: [
                ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Colors.tealAccent),
                    onPressed: (){
                  Navigator.pop(context);
                }, child: Text("Cancel")),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Colors.lightGreenAccent),
                    onPressed: () async {
                  if(quoteController.text.isNotEmpty) {
                    await firebaseService.addQuote(Quote(
                        quoteController.text,
                        authorController.text,
                        submitby: "${FirebaseAuth.instance.currentUser?.uid}"), context);
                    Navigator.pop(context);
                  }else{
                    Fluttertoast.showToast(msg: "Please enter a quote to submit");
                  }
                }, child: Text("Post Quote")),
              ],
              content:Column(
              children: [
                TextField(
                  decoration: InputDecoration(
                    label: Card(child: Text("Quote:"),),
                    hintText: "Enter quote here",
                    fillColor: Colors.tealAccent, filled: true,
                  ),
                  maxLines: 4,
                  controller: quoteController,
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: TextField(
                    decoration: InputDecoration(
                        label: Card(child: Text("Author:"),),
                        hintText: "Usman Arshad",
                        fillColor: Colors.tealAccent, filled: true),
                    controller: authorController,
                  ),
                ),
              ],
            ),),
          ),
      ),
    );
  }
}
