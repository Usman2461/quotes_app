import 'package:clipboard/clipboard.dart';
import 'package:daily_quotes/constants/colors.dart';
import 'package:daily_quotes/floor_db/quotes_repository.dart';
import 'package:daily_quotes/widgets/big_text.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:share_plus/share_plus.dart';

import '../../widgets/quote_widget.dart';

class FavouriteQuotes extends StatefulWidget {
  const FavouriteQuotes({Key? key}) : super(key: key);

  @override
  State<FavouriteQuotes> createState() => _FavouriteQuotesState();
}

class _FavouriteQuotesState extends State<FavouriteQuotes> {
  @override
  Widget build(BuildContext context) {

    QuotesRepository repository = QuotesRepository();

    bool isFavorite = false;

    return Scaffold(
      backgroundColor: Color(skyBlue),
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
                  child: Text("Daily Quotes")),
              Expanded(child: SizedBox()),
                Text("Add New"),
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
                text: "Favorites",
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12.0),
                child: TextField(
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Color(lightGrey),
                      hintText: "Search",
                      prefixIcon: Icon(Icons.search),
                    border: UnderlineInputBorder(borderSide: BorderSide.none, borderRadius: BorderRadius.circular(8.0))
                  ),
                ),
              ),

              repository.favorites.isEmpty ?
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Image(height:200, width:200, image: AssetImage("assets/images/hearts.png"),),
                  ),
                  Center(child: BigText(text: "You don't have any favorites yet.", alignment: TextAlign.center,))

                ],
              ) :
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: repository.favorites.length,
                itemBuilder: (context, index) {
                  String myquotetext = repository.favorites[index].quote;

                  return QuoteWidget(snapshot: repository.favorites[index],
                  onDataUpdated: (){

                    setState(() {

                    });

                  },
                  );
                },
                // separatorBuilder: (jcontext, index) {
                //   return Padding(
                //     padding: const EdgeInsets.symmetric(vertical: 4.0),
                //     child: Divider(),
                //   );
                // },
              )
             ],
          ),
        ),
      ),
    );
  }
}
