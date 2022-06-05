import 'package:daily_quotes/models/language_constants.dart';
import 'package:daily_quotes/providers/theme_provider.dart';
import 'package:daily_quotes/screens/about_us/about_us.dart';
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
import 'package:daily_quotes/screens/privacy_policy/privacy_policy.dart';
import 'package:daily_quotes/screens/quote_screen/quote_screen.dart';
import 'package:daily_quotes/screens/report_bug_screen/report_bug.dart';
import 'package:daily_quotes/screens/settings/app_settings.dart';
import 'package:daily_quotes/screens/success_screen/success_screen.dart';
import 'package:daily_quotes/screens/support_screen/support_screen.dart';
import 'package:daily_quotes/services/firebase_service.dart';
import 'package:daily_quotes/widgets/rateInit.dart';
import 'package:daily_quotes/widgets/rate_app.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();

  static void setLocale(BuildContext context, Locale newLocale) {
    _MyAppState? state = context.findAncestorStateOfType<_MyAppState>();
    state?.setLocale(newLocale);
  }
}

class _MyAppState extends State<MyApp> {
  Locale? _locale;

  setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  void didChangeDependencies() {
    getLocale().then((locale) => setLocale(locale));
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => FirebaseService()),
        ChangeNotifierProvider(create: (_) => ThemeProvider())
      ],
      child: Builder(builder: (context) {
        final themeProvider = Provider.of<ThemeProvider>(context);
        return MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          locale: _locale,
          themeMode: themeProvider.themeMode,
          theme: MyThemes.lightTheme.copyWith(
              textTheme: Theme.of(context)
                  .textTheme
                  .apply(fontFamily: themeProvider.fontFamily)),
          darkTheme: MyThemes.darkTheme.copyWith(
              textTheme: Theme.of(context)
                  .textTheme
                  .apply(fontFamily: themeProvider.fontFamily)),
          initialRoute: "/motivate-buy",
          routes: {
            "/motivate-buy": (context) => MotivationPremium(),
            "/main-screen": (context) => MainScreen(),
            "/favourite": (context) => FavouriteQuotes(),
            "/quote": (context) => QuoteScreen(),
            "/past-quote": (context) => PastQuotes(),
            "/collections": (context) => Collections(),
            "/categories": (context) => Categories(),
            "/check-out": (context) => CheckOut(),
            "/payment": (context) => ProceedPayment(),
            "/donate": (context) => DonationScreen(),
            "/success": (context) => SuccessScreen(),
            "/report-bug": (context) => ReportBug(),
            "/acknowledgements": (context) => Acknowledgements(),
            "/privacy-policy": (context) => PrivacyPolicy(),
            "/about-us": (context) => AboutUs(),
            "/support": (context) => SupportScreen(),
            "/app-settings": (context) =>
                RateAppInitWidget(builder: (rateMyApp) => AppSettings()),
          },
        );
      }),
    );
  }
}
