import 'package:daily_quotes/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:google_fonts/google_fonts.dart';

class ThemeProvider extends ChangeNotifier{
ThemeMode themeMode = ThemeMode.dark; String? fontFamily =  GoogleFonts.aladin(fontSize: 12,).fontFamily;

bool get isDarkMode => themeMode == ThemeMode.dark;
String? get theFontFamily => fontFamily;

void toggleTheme(bool isOn){
  themeMode = isOn? ThemeMode.dark:ThemeMode.light;
  notifyListeners();
}

void toogleFont(String family){
  fontFamily = family;
  notifyListeners();
}


}
class MyThemes{

  static final darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.grey.shade900,
    colorScheme: ColorScheme.dark(),
  );
  static final lightTheme = ThemeData(
    scaffoldBackgroundColor:  Color(skyBlue),
    colorScheme: ColorScheme.light(),
  );

}