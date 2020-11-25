import 'package:flutter/material.dart';

ThemeData darkTheme() {
  return ThemeData(
    fontFamily: "Open Sans",
    buttonTheme: ButtonThemeData(
        buttonColor: Color(0xFF0CE8CE), textTheme: ButtonTextTheme.normal),
    accentColor: Color(0xFF0CE8CE),
    primaryColor: Color(0xFF2C3039),
    canvasColor: Colors.grey,
    cardColor: Color(0xFF2C3039),
    unselectedWidgetColor: Colors.white,
    scaffoldBackgroundColor: Color(0xFF1C2028),
    backgroundColor: Color(0xFF1C2028),
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    inputDecorationTheme: InputDecorationTheme(
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(15)),
        borderSide: BorderSide(color: Color(0xFF0CE8CE)),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(15)),
        borderSide: BorderSide(color: Colors.grey),
      ),
      contentPadding: EdgeInsets.all(10),
      hintStyle: TextStyle(
          color: Colors.grey,
          fontSize: 15,
          fontWeight: FontWeight.w200,
          fontStyle: FontStyle.italic,
          fontFamily: "Open Sans"),
    ),
    snackBarTheme: SnackBarThemeData(
      backgroundColor: Colors.red,
      actionTextColor: Colors.white,
      contentTextStyle: TextStyle(
          color: Colors.red,
          fontSize: 15,
          fontWeight: FontWeight.bold,
          fontFamily: "Open Sans"),
    ),
    textTheme: TextTheme(
      headline6: TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.bold,
          fontFamily: "Open Sans"),
      headline5: TextStyle(
          color: Colors.white,
          fontSize: 15,
          fontWeight: FontWeight.normal,
          fontFamily: "Open Sans"),
      headline4: TextStyle(
          color: Colors.grey,
          fontSize: 15,
          fontWeight: FontWeight.w200,
          fontStyle: FontStyle.italic,
          fontFamily: "Open Sans"),
      headline3: TextStyle(
          color: Colors.white,
          fontSize: 13,
          fontWeight: FontWeight.w100,
          fontFamily: "Open Sans"),
      button: TextStyle(
          color: Color(0xFF1C2028),
          fontSize: 15,
          fontWeight: FontWeight.bold,
          fontFamily: "Open Sans"),
    ),
  );
}
