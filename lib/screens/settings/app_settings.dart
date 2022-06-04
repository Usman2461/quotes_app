import 'package:daily_quotes/constants/colors.dart';
import 'package:daily_quotes/models/languages.dart';
import 'package:daily_quotes/providers/theme_provider.dart';
import 'package:daily_quotes/widgets/big_text.dart';
import 'package:daily_quotes/widgets/rate_app.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:rate_my_app/rate_my_app.dart';

import '../../main.dart';
import '../../models/language_constants.dart';
import '../../widgets/rateInit.dart';

class AppSettings extends StatefulWidget {
  AppSettings({
    this.rateMyApp,
    Key? key,
  }) : super(key: key);
  RateMyApp? rateMyApp;

  @override
  State<AppSettings> createState() => _AppSettingsState();
}

class _AppSettingsState extends State<AppSettings> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_) async {
      await widget.rateMyApp!.init();
      if (mounted && widget.rateMyApp!.shouldOpenDialog) {
        widget.rateMyApp!.showStarRateDialog(context);
      }
    });
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
                  widget.rateMyApp?.showStarRateDialog(
                    context,
                    title: 'Rate This App',
                    message: 'Do you like this app? Please leave a rating',
                    starRatingOptions: StarRatingOptions(initialRating: 4),
                  );
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
