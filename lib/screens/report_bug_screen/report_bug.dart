import 'package:daily_quotes/constants/colors.dart';
import 'package:flutter/material.dart';

class ReportBug extends StatelessWidget {
  const ReportBug({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            child: Icon(Icons.send, color: Colors.black,),
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
                  maxLines: 10,
                  decoration: InputDecoration(
                      fillColor: Color(skyBlue),
                      filled: true,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0))),
                ),
              ),
              ElevatedButton(onPressed: (){}, child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.attach_file),
                  Text("Attach a File", style: TextStyle(color: Colors.black),),
                ],
              ),)
            ],
          ),
        ),
      ),
    );
  }
}
