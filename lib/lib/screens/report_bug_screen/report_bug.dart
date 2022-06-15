import 'package:daily_quotes/constants/colors.dart';
import 'package:daily_quotes/models/bug.dart';
import 'package:daily_quotes/services/firebase_service.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class ReportBug extends StatelessWidget {

  TextEditingController titleController = TextEditingController();
  TextEditingController detailController = TextEditingController();
  ReportBug({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FirebaseService firebaseService =
    Provider.of<FirebaseService>(context, listen: false);
    return Scaffold(
      backgroundColor: Colors.lightGreen,
      appBar: AppBar(
        title: Text("Report a Bug", style: TextStyle(color: Colors.black),),
        centerTitle: true,
        backgroundColor: Color(skyBlue),
        leading: Icon(
          Icons.close,
          color: Colors.black,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
                onTap: () async{
                  if(titleController.text.isNotEmpty && detailController.text.isNotEmpty){
                    await firebaseService.reportABug(Bug(
                        titleController.text,
                        detailController.text,), context);
                    Navigator.pop(context);
                  }
                  else{
                    Fluttertoast.showToast(msg: "Please enter both title and detail");
                  }
                },
                child: Icon(Icons.send, color: Colors.black,)),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "Bug Title:",
                style: TextStyle(fontSize: 24.0),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: TextField(
                  controller: titleController,
                  decoration: InputDecoration(
                      fillColor: Color(skyBlue),
                      filled: true,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0))),
                ),
              ),
              Text(
                "Bug Detail:",
                style: TextStyle(fontSize: 24.0),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: TextField(
                  controller: detailController,
                  maxLines: 10,
                  decoration: InputDecoration(
                      fillColor: Color(skyBlue),
                      filled: true,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0))),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
