import 'dart:convert';

import 'package:clipboard/clipboard.dart';
import 'package:daily_quotes/services/firebase_service.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:share_plus/share_plus.dart';

import '../constants/colors.dart';
import '../favorite_utils/favorite.dart';
import '../favorite_utils/quotes_repository.dart';

class QuoteWidget extends StatefulWidget {
  const QuoteWidget({Key? key, required this.snapshot, required this.onDataUpdated}) : super(key: key);

  final FavoriteModel snapshot;
  final Function onDataUpdated;


  @override
  State<QuoteWidget> createState() => _QuoteWidgetState();
}

class _QuoteWidgetState extends State<QuoteWidget> {

  bool isFavorite = false;


  @override
  Widget build(BuildContext context) {


    String myquotetext = widget.snapshot.quote;
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, "/quote");
      },
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0)),
        color: Colors.lightBlueAccent,
        child: Padding(
          padding: const EdgeInsets.all(0),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  "Today's Quote",
                  style: TextStyle(
                      fontSize: 18.0, color: Colors.lightGreen),
                ),
                SizedBox(
                  height: 14,
                ),
                Text(
                  myquotetext,
                  style: TextStyle(
                      color: Color(AdarkGrey), fontSize: 30.0),
                ),
                SizedBox(
                  height: 5.0,
                ),
                Text(
                  "-- ${widget.snapshot.author}",
                  style: TextStyle(
                      color: Color(AdarkGrey),
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic),
                ),
                SizedBox(
                  height: 5.0,
                ),
                Text(
                  "-- ${widget.snapshot.submitby}",
                  style: TextStyle(
                      color: Color(AdarkGrey),
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic),
                ),
                Row(
                  mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                            onPressed: () {
                              FlutterClipboard.copy(myquotetext);
                              Fluttertoast.showToast(
                                  msg: "Copied");
                            },
                            icon: Icon(Icons.copy_outlined)),
                        IconButton(
                          onPressed: () async {

                            if (isFavorite) {
                              _deleteFromFavorites(FavoriteModel.fromJson(jsonDecode(jsonEncode(widget.snapshot))));
                            } else {
                              _addToFavorites(FavoriteModel.fromJson(jsonDecode(jsonEncode(widget.snapshot))));

                            }



                          },
                          icon:  getFavoriteIcon(FavoriteModel.fromJson(jsonDecode(jsonEncode(widget.snapshot)))),),
                        IconButton(
                            onPressed: () async {
                              await Share.share(myquotetext);
                            },
                            icon: Icon(Icons.share_rounded)),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }



  void _addToFavorites(FavoriteModel favoriteModel) async {
    FirebaseService().addFavoriteQuoteToFirebase(favoriteModel).then((value) {
      widget.onDataUpdated();
    });

    QuotesRepository repository = QuotesRepository();
    repository.favorites.add(favoriteModel);

  }


  void _deleteFromFavorites(FavoriteModel favoriteModel) async {
    Fluttertoast.showToast(msg: 'Removing please wait');
    QuotesRepository repository = QuotesRepository();
    repository.favorites.removeWhere((element) => element.quote == favoriteModel.quote && element.submitby == favoriteModel.submitby);
    FirebaseService().deleteFavoriteQuoteFromFirebase(favoriteModel).then((value) {
      widget.onDataUpdated();
      Fluttertoast.showToast(msg: 'Removed');
    });
  }

  Widget getFavoriteIcon(FavoriteModel snapshot) {

    QuotesRepository repository = QuotesRepository();

    for (final f in repository.favorites) {
      if (f.quote == snapshot.quote && f.submitby == snapshot.submitby && f.author ==snapshot.author) {
          isFavorite = true;
          return Icon(Icons.star,
              color:  Colors.red);

      }
    }
    isFavorite = false;
    return Icon(Icons.star,
        color:  Colors.white);
  }
}
