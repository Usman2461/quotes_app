import 'package:daily_quotes/constants/colors.dart';
import 'package:daily_quotes/models/languages.dart';
import 'package:daily_quotes/providers/theme_provider.dart';
import 'package:daily_quotes/widgets/big_text.dart';
import 'package:daily_quotes/widgets/rate_app.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:rate_my_app/rate_my_app.dart';

import 'package:rating_dialog/rating_dialog.dart';
import '../../main.dart';
import '../../models/language_constants.dart';
import '../../widgets/rateInit.dart';
import 'package:in_app_review/in_app_review.dart';

class AppSettings extends StatefulWidget {
//------------------------------------------------//

  // AppSettings({
  //   this.rateMyApp,
  //   Key? key,
  // }) : super(key: key);
  // RateMyApp? rateMyApp;

  @override
  State<AppSettings> createState() => _AppSettingsState();
}

class _AppSettingsState extends State<AppSettings> {
  void _showRatingDialog(BuildContext context) {
    // actual store listing review & rating
    void _rateAndReviewApp() async {
      // refer to: https://pub.dev/packages/in_app_review
      final _inAppReview = InAppReview.instance;

      if (await _inAppReview.isAvailable()) {
        print('request actual review from store');
        _inAppReview.requestReview();
      } else {
        print('open actual store listing');
        // TODO: use your own store ids
        _inAppReview.openStoreListing(
          appStoreId: '<your app store id>',
          microsoftStoreId: '<your microsoft store id>',
        );
      }
    }

    final _dialog = RatingDialog(
      initialRating: 1.0,
      // your app's name?
      title: Text(
        'Rating Dialog',
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
      ),
      // encourage your user to leave a high rating?
      message: Text(
        'Tap a star to set your rating. Add more description here if you want.',
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 15),
      ),
      // your app's logo?
      image: const FlutterLogo(size: 100),
      submitButtonText: 'Submit',
      commentHint: 'Set your custom comment hint',
      onCancelled: () => print('cancelled'),
      onSubmitted: (response) {
        print('rating: ${response.rating}, comment: ${response.comment}');

        // TODO: add your own logic
        if (response.rating < 3.0) {
          // send their comments to your email or anywhere you wish
          // ask the user to contact you instead of leaving a bad review
        } else {
          _rateAndReviewApp();
        }
      },
    );

    // show the dialog
    showDialog(
      context: context,
      barrierDismissible: true, // set to false if you want to force a rating
      builder: (context) => _dialog,
    );

    //-------------------------------
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // WidgetsBinding.instance?.addPostFrameCallback((_) async {
    //   await widget.rateMyApp!.init();
    //   if (mounted && widget.rateMyApp!.shouldOpenDialog) {
    //     widget.rateMyApp!.showStarRateDialog(context);
    //   }
    // });
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context, listen: false);
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
                        child: Text("Daily Quotes",
                            style: TextStyle(fontSize: 24.0)))
                  ],
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
                text: 'Settings',
              ),
              SizedBox(
                height: 10.0,
              ),
              SwitchListTile.adaptive(
                  activeColor: Colors.lightGreen,
                  tileColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14.0)),
                  title: Text(
                    "Notifications",
                    style: TextStyle(fontSize: 24.0),
                  ),
                  value: true,
                  onChanged: (value) {}),
              Divider(
                thickness: 1,
              ),
              Consumer<ThemeProvider>(
                builder: (BuildContext context, provider, Widget? child) {
                  return Column(
                    children: [
                      ListTile(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14.0)),
                        leading:
                            Text("Languages", style: TextStyle(fontSize: 24.0)),
                        tileColor: Colors.white,
                        trailing: DropdownButton(
                          underline: SizedBox(),
                          icon: Icon(
                            Icons.language,
                            color: Colors.white,
                          ),
                          onChanged: (Language? language) async {
                            if (language != null) {
                              Locale _locale =
                                  await setLocale(language.languageCode);
                              MyApp.setLocale(context, _locale);
                            }
                          },
                          items: Language.languageList()
                              .map(
                                (e) => DropdownMenuItem<Language>(
                                  value: e,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text(
                                        e.languageCode,
                                        style: TextStyle(fontSize: 30),
                                      ),
                                      Text(e.name),
                                    ],
                                  ),
                                ),
                              )
                              .toList(),
                        ),
                      ),
                      ListTile(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14.0)),
                        leading:
                            Text("Fonts", style: TextStyle(fontSize: 24.0)),
                        tileColor: Colors.white,
                        trailing: PopupMenuButton(
                          itemBuilder: (BuildContext context) {
                            return [
                              PopupMenuItem(
                                child: Text("Font1"),
                                value: "font1",
                                onTap: () {
                                  provider.toogleFont(
                                      GoogleFonts.aBeeZee().fontFamily!);
                                },
                              ),
                              PopupMenuItem(
                                child: Text("Font1"),
                                value: "font2",
                                onTap: () {
                                  provider.toogleFont(
                                      GoogleFonts.abel().fontFamily!);
                                },
                              ),
                              PopupMenuItem(
                                child: Text("Font1"),
                                value: "font3",
                                onTap: () {
                                  provider.toogleFont(
                                      GoogleFonts.abrilFatface().fontFamily!);
                                },
                              ),
                            ];
                          },
                          initialValue: "font1",
                          icon: Icon(Icons.arrow_drop_down),
                        ),
                      ),
                      Divider(
                        thickness: 1,
                      ),
                      SwitchListTile.adaptive(
                          tileColor: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14.0)),
                          title: Text("Dark Mode",
                              style: TextStyle(fontSize: 24.0)),
                          value: provider.isDarkMode,
                          onChanged: (value) {
                            provider.toggleTheme(value);
                          })
                    ],
                  );
                },
              ),
              Divider(
                thickness: 1,
              ),
              ListTile(
                tileColor: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14.0)),
                onTap: () {
                  Navigator.pushNamed(context, "/privacy-policy");
                },
                title: Text("Privacy Policy", style: TextStyle(fontSize: 24.0)),
              ),
              Divider(
                thickness: 1,
              ),
              ListTile(
                tileColor: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14.0)),
                title: Text("About Us", style: TextStyle(fontSize: 24.0)),
              ),
              Divider(
                thickness: 1,
              ),
              ListTile(
                tileColor: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14.0)),
                title: Text("Support", style: TextStyle(fontSize: 24.0)),
              ),
              Divider(
                thickness: 1,
              ),
              ListTile(
                tileColor: Colors.white,
                onTap: () {
                  _showRatingDialog(context);
                  // widget.rateMyApp?.showStarRateDialog(
                  //   context,
                  //   title: 'Rate This App',
                  //   message: 'Do you like this app? Please leave a rating',
                  //   starRatingOptions: StarRatingOptions(initialRating: 4),
                  // );
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14.0)),
                title: Text("Rate Us", style: TextStyle(fontSize: 24.0)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
