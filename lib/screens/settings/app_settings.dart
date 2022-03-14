import 'package:daily_quotes/constants/colors.dart';
import 'package:daily_quotes/widgets/big_text.dart';
import 'package:flutter/material.dart';

class AppSettings extends StatelessWidget {
  const AppSettings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff75ffff),
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
                          child: Text("Daily Quotes", style: TextStyle(fontSize: 24.0)))],
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
            BigText(text: 'Settings',),
            SizedBox(height: 10.0,),
            SwitchListTile.adaptive(
              activeColor: Colors.lightGreen,
                tileColor: Colors.white,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14.0)),
                title:Text("Notifications", style: TextStyle(fontSize: 24.0),),value: true, onChanged: (value){}),
            Divider(thickness: 1,),
            SwitchListTile.adaptive(
                tileColor: Colors.white,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14.0)),
                title:Text("Sound", style: TextStyle(fontSize: 24.0)),value: false, onChanged: (value){}),
              Divider(thickness: 1,),
            SwitchListTile.adaptive(
                tileColor: Colors.white,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14.0)),
                title:Text("Font Size", style: TextStyle(fontSize: 24.0)),value: false, onChanged: (value){}),
              Divider(thickness: 1,),
            SwitchListTile.adaptive(
                tileColor: Colors.white,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14.0)),
                title:Text("Dark Mode", style: TextStyle(fontSize: 24.0)),value: false, onChanged: (value){}),
              Divider(thickness: 1,),
            ListTile(
              tileColor: Colors.white,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14.0)),
              title: Text("Privacy Policy", style: TextStyle(fontSize: 24.0)),),
              Divider(thickness: 1,),
            ListTile(
              tileColor: Colors.white,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14.0)),
              title: Text("About Us", style: TextStyle(fontSize: 24.0)),),
              Divider(thickness: 1,),
            ListTile(
              tileColor: Colors.white,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14.0)),
              title: Text("Support", style: TextStyle(fontSize: 24.0)),),
              Divider(thickness: 1,),
            ListTile(
              tileColor: Colors.white,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14.0)),
              title: Text("Rate Us", style: TextStyle(fontSize: 24.0)),),


          ],),
        ),
      ),
    );
  }
}
