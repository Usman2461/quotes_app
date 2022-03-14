import 'package:daily_quotes/constants/colors.dart';
import 'package:daily_quotes/widgets/big_text.dart';
import 'package:flutter/material.dart';
class AppIcons extends StatelessWidget {
  const AppIcons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size(MediaQuery.of(context).size.width, 200.0),
          child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [GestureDetector(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: Icon(Icons.arrow_back_ios)), GestureDetector(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: Text("Daily Quotes"))],
                ),
              ))),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(children: [
          BigText(text: "App Icon"),
          Expanded(
            child: OrientationBuilder(
              builder: (BuildContext context, Orientation orientation) {
                return GridView.builder(
                  shrinkWrap: true,
                  itemCount: 11,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: (orientation == Orientation.portrait) ? 2 : 3),
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Card(
                        color: Color(0xff28bb05),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
                        child: new GridTile(
                          child: Image(
                            fit: BoxFit.cover,
                            height: 50,
                            width: 50,
                            image: AssetImage("assets/images/icon${index+1}.png"),),//just for testing, will fill with image later
                        ),
                      ),
                    );
                  },
                );

              },
            ),
          ),
        ],),
      ),
    );
  }
}
