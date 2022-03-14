import 'package:daily_quotes/screens/acknowledgements_screen/acknowledgement.dart';
import 'package:daily_quotes/screens/categories/categories.dart';
import 'package:daily_quotes/screens/checkout_screen/checkout_screen.dart';
import 'package:daily_quotes/screens/checkout_screen/payment_screen.dart';
import 'package:daily_quotes/screens/donation/donation_screen.dart';
import 'package:daily_quotes/screens/favourites/favourites_screen.dart';
import 'package:daily_quotes/screens/main_screen/main_screen.dart';
import 'package:daily_quotes/screens/motivation_premium/motivation_premium.dart';
import 'package:daily_quotes/screens/my_collections/my_collections.dart';
import 'package:daily_quotes/screens/past_quotes/past_quotes.dart';
import 'package:daily_quotes/screens/quote_screen/quote_screen.dart';
import 'package:daily_quotes/screens/reminder/reminder.dart';
import 'package:daily_quotes/screens/report_bug_screen/report_bug.dart';
import 'package:daily_quotes/screens/success_screen/success_screen.dart';
import 'package:daily_quotes/screens/themes/themes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ).copyWith(scaffoldBackgroundColor: Colors.white),
      initialRoute: "/motivate-buy",
      routes: {
        "/motivate-buy": (context)=>MotivationPremium(),
        "/main-screen" : (context)=>MainScreen(),
        "/favourite" : (context)=>FavouriteQuotes(),
        "/themes" : (context)=>Themes(),
        "/reminders" : (context)=>Reminders(),
        "/quote" : (context)=>QuoteScreen(),
        "/past-quote" : (context)=>PastQuotes(),
        "/collections" : (context)=>Collections(),
        "/categories" : (context)=>Categories(),
        "/check-out" : (context) => CheckOut(),
        "/payment" : (context) => ProceedPayment(),
        "/donate" : (context) => DonationScreen(),
        "/success" : (context) => SuccessScreen(),
        "/report-bug" : (context) => ReportBug(),
        "/acknowledgements" : (context) => Acknowledgements(),


        
      },
    );
  }
}
