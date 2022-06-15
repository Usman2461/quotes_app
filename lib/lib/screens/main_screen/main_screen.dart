import 'dart:convert';

import 'package:clipboard/clipboard.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:daily_quotes/models/quotes.dart';
import 'package:daily_quotes/providers/theme_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';

import '../../favorite_utils/favorite.dart';
import '../../favorite_utils/quotes_repository.dart';
import '../../widgets/quote_widget.dart';
import 'cdrawer.dart';

class MainScreen extends StatefulWidget {
  MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final Stream<QuerySnapshot> quotesStream =
      FirebaseFirestore.instance.collection('quotes').snapshots();

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  User? user = FirebaseAuth.instance.currentUser;

  @override
  void initState() {
    super.initState();
    _getUserData();
  }

  void _getUserData() {
    User? user = FirebaseAuth.instance.currentUser;

    QuotesRepository repository = QuotesRepository();
    if (user != null) {
      repository.user = user;
      _getAllFavorites();
    }
  }

  void _getAllFavorites() async {
    QuotesRepository repository = QuotesRepository();
    final dynamic favorites = FirebaseFirestore.instance
        .collection('users')
        .doc(repository.user.uid)
        .collection('fav')
        .snapshots()
        .listen((event) {
      repository.favorites.clear();
      print('size of favorites length: ${event.docs.length}');
      for (var f in event.docs) {
        print('data from getAllFavorites_____________: ${f.data()}');
        repository.favorites.add(FavoriteModel.fromJson(f.data()));
        setState(() {});
      }
      print('repository length: ${repository.favorites.length}');
    });

    print('fav_________________: ${favorites}');
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context, listen: true);

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor:
          themeProvider.isDarkMode ? Colors.lightGreen : Colors.white,
      appBar: AppBar(
        title: Center(
            child: Text(
          "Quotes",
          style: TextStyle(color: Colors.black, fontSize: 24.0),
        )),
        elevation: 0.0,
        backgroundColor: Colors.lightGreen,
        leading: GestureDetector(
            onTap: () {},
            child: GestureDetector(
              onTap: () {
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
        child: CDrawer(
          onDrawerClose: () {
            setState(() {
              print('on Drawer closed called');
            });
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: StreamBuilder(
            stream: quotesStream,
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasError) {
                return Center(child: Text("Something went wrong"));
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }

              return ListView.builder(
                shrinkWrap: true,
                itemCount: 1,
                itemBuilder: (context, index) {
                  String myquotetext = snapshot.data!.docs.last.get("quote");
                  return QuoteWidget(
                    snapshot: FavoriteModel.fromJson(jsonDecode(
                        jsonEncode(snapshot.data!.docs.last.data()))),
                    onDataUpdated: () {
                      setState(() {});
                    },
                  );
                },
                // separatorBuilder: (jcontext, index) {
                //   return Padding(
                //     padding: const EdgeInsets.symmetric(vertical: 4.0),
                //     child: Divider(),
                //   );
                // },
              );
            }),
      ),
    );
  }
}
