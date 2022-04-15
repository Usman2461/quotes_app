import 'package:flutter/material.dart';
import 'package:rate_my_app/rate_my_app.dart';

class RateAppInitWidget extends StatefulWidget with ChangeNotifier {
  final Widget Function(RateMyApp)? builder;
  RateMyApp? rateMyApp;

  RateAppInitWidget({Key? key, this.builder}) : super(key: key);

  @override
  State<RateAppInitWidget> createState() => _RateAppInitWidgetState();
}

class _RateAppInitWidgetState extends State<RateAppInitWidget> {
  static const playStoreId = "com.qutech.quotesapp";
  static const appStoreId = "com.qutech.quotesapp";

  @override
  Widget build(BuildContext context) {
    return RateMyAppBuilder(
      rateMyApp: RateMyApp(
        googlePlayIdentifier: playStoreId,
        appStoreIdentifier: appStoreId,
      ),
      onInitialized: (BuildContext context, RateMyApp rateMyApp) {
        setState(() => widget.rateMyApp = rateMyApp);
      },
      builder: (BuildContext context) => widget.rateMyApp == null
          ? Center(
              child: CircularProgressIndicator(),
            )
          : widget.builder!(widget.rateMyApp!),
    );
  }
}
