import 'package:flutter/material.dart';


class CustomTheme {
  static ThemeData get lightTheme { //1
    return ThemeData( //2
        primaryColor: const Color(0xffff85bd),
        scaffoldBackgroundColor: Color(0xffdaebe5),
        appBarTheme: const AppBarTheme(
          color: Color(0xff1685bd),
          titleTextStyle: TextStyle(color:Color(0xffdaebe5)),
        ),
        fontFamily: 'Montserrat', //3
        elevatedButtonTheme: ElevatedButtonThemeData( // 4
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
            primary: Color(0xff1665a0),
          ),
        ),
        buttonTheme: ButtonThemeData( // 4
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
          buttonColor: Color(0xff1665a0),
        )
    );
  }
}