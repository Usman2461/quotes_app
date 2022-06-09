import 'package:daily_quotes/animations/custom_page_route2.dart';
import 'package:daily_quotes/constants/colors.dart';
import 'package:daily_quotes/providers/theme_provider.dart';
import 'package:daily_quotes/screens/acknowledgements_screen/acknowledgement.dart';
import 'package:daily_quotes/screens/add_quote/add_quotes.dart';
import 'package:daily_quotes/screens/app_icons/app_icons.dart';
import 'package:daily_quotes/screens/donation/donation_screen.dart';
import 'package:daily_quotes/screens/favourites/favourites_screen.dart';
import 'package:daily_quotes/screens/my_collections/my_collections.dart';
import 'package:daily_quotes/screens/past_quotes/past_quotes.dart';
import 'package:daily_quotes/screens/report_bug_screen/report_bug.dart';
import 'package:daily_quotes/screens/settings/app_settings.dart';
import 'package:daily_quotes/widgets/cbutton.dart';
import 'package:daily_quotes/widgets/settings_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rate_my_app/rate_my_app.dart';

class CDrawer extends StatefulWidget {
  CDrawer({Key? key, required this.onDrawerClose}) : super(key: key);

  final Function onDrawerClose;

  @override
  State<CDrawer> createState() => _CDrawerState();
}

class _CDrawerState extends State<CDrawer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(skyBlue),
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              UserAccountsDrawerHeader(
                  currentAccountPicture: Image(
                    image: AssetImage("assets/images/icon1.png"),
                  ),
                  decoration: BoxDecoration(color: Colors.lightGreen),
                  accountName: Text(
                    "Your Name",
                    style: TextStyle(color: Colors.black),
                  ),
                  accountEmail: Text(
                    "youremail@gmail.com",
                    style: TextStyle(color: Colors.black),
                  )),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Image(
                            image: AssetImage("assets/images/heading.png"),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Text(
                              "Daily Quotes",
                              style: TextStyle(
                                  color: Color(AdarkGrey),
                                  fontSize: 30,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ],
                      ),
                    ),
                    CButton(
                      title: 'Go Premium',
                      onTap: () {
                        Navigator.pushNamed(context, "/motivate-buy");
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20.0),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Image(
                            image: AssetImage("assets/images/heading2.png"),
                          ),
                          Positioned(
                            right: 50,
                            child: Text(
                              "SETTINGS",
                              style: TextStyle(fontSize: 20.0),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SettingTile(
                      title: 'General',
                      onTap: () {
                         Navigator.of(context).push(CustomPageRoute2(
                            child: AppSettings(
                             ),
                            begin: Offset(1, 0)));
                      },
                      icon: Icon(Icons.settings),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20.0),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Image(
                            image: AssetImage("assets/images/heading2.png"),
                          ),
                          Positioned(
                            right: 30,
                            child: Text(
                              "MY OPTIONS",
                              style: TextStyle(fontSize: 20.0),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SettingTile(
                      title: 'My Groups',
                      onTap: () {
                        Navigator.of(context).push(CustomPageRoute2(
                            child: Collections(), begin: Offset(1, 0)));
                      },
                      icon: Icon(Icons.collections_bookmark_outlined),
                    ),
                    SettingTile(
                      title: 'Submit a Quote',
                      onTap: () {
                        Navigator.of(context).push(CustomPageRoute2(
                            child: AddQuote(), begin: Offset(1, 0)));
                      },
                      icon: Icon(Icons.edit),
                    ),
                    SettingTile(
                      title: 'Past Quotes',
                      onTap: () {
                        Navigator.of(context).push(CustomPageRoute2(
                            child: PastQuotes(), begin: Offset(1, 0)));
                      },
                      icon: Icon(Icons.timelapse_outlined),
                    ),
                    SettingTile(
                      title: 'Favorites',
                      onTap: () {
                        Navigator.of(context).push(CustomPageRoute2(
                            child: FavouriteQuotes(), begin: Offset(1, 0))).then((value) => widget.onDrawerClose());
                      },
                      icon: Icon(Icons.favorite),
                    ),
                    SettingTile(
                      title: 'Donate',
                      onTap: () {
                        Navigator.of(context).push(CustomPageRoute2(
                            child: DonationScreen(), begin: Offset(1, 0)));
                      },
                      icon: Icon(Icons.monetization_on_sharp),
                    ),
                    SettingTile(
                      title: 'Report a Bug',
                      onTap: () {
                        Navigator.of(context).push(CustomPageRoute2(
                            child: ReportBug(), begin: Offset(1, 0)));
                      },
                      icon: Icon(Icons.monetization_on_sharp),
                    ),
                    SettingTile(
                      title: 'Acknowledgements',
                      onTap: () {
                        Navigator.of(context).push(CustomPageRoute2(
                            child: Acknowledgements(), begin: Offset(1, 0)));
                      },
                      icon: Icon(Icons.account_tree),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
