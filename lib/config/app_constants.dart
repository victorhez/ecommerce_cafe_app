import 'dart:ui';
import 'package:flutter/material.dart';

class AppConstants {
  static String appName = "E-commerce Cafe";
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  static Color appPrimaryColor = Color(0xff372922);
  static Color appSecondaryColor = Color(0xff9b6f4c);

  static Color disableColor = Color(0xffacacb1);
  static Color unselectedWidgetColor = Color(0xffDBDFE3);
  static Color inputTextColor = Color(0xff323232);

  static Color customBackgroundColor = Color(0xffFBFBF9);

  static Color warningColor = Color(0xffFFAB2B);
  static Color dangerColor = Color(0xffFF695B);
  static Color blueColor = Color(0xff4D7CFE);

  static ThemeData appTheme = ThemeData(
    pageTransitionsTheme: PageTransitionsTheme(builders: {
      TargetPlatform.android: CupertinoPageTransitionsBuilder(),
      TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
    }),
    fontFamily: 'Arial',
    primaryColor: appPrimaryColor,
    accentColor: appSecondaryColor,
    backgroundColor: Colors.white,
    scaffoldBackgroundColor: Colors.white,
    textTheme: TextTheme(
      headline1: TextStyle(
          color: inputTextColor, fontWeight: FontWeight.w400, fontSize: 28.0),
      headline2: TextStyle(
          color: inputTextColor, fontWeight: FontWeight.w400, fontSize: 20.0),
      headline3: TextStyle(
          color: inputTextColor, fontWeight: FontWeight.w400, fontSize: 18.0),
      bodyText1: TextStyle(fontWeight: FontWeight.w400, fontSize: 15.0, color: AppConstants.inputTextColor),
      bodyText2: TextStyle(fontWeight: FontWeight.w200, fontSize: 12.0),
    ),
  );

  static BoxDecoration specialBoxDecoration = BoxDecoration(
      color: Colors.white,
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.12),
          blurRadius: 15.0,
          // has the effect of softening the shadow
          spreadRadius: 0.0,
          // has the effect of extending the shadow
          offset: Offset(0.0, 2.0),
        )
      ],
      borderRadius: BorderRadius.circular(15.0));

  static BoxDecoration specialBoxDecorationWithBorder = BoxDecoration(
      color: Colors.white,
      border: Border.all(color: appPrimaryColor),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.12),
          blurRadius: 15.0,
          // has the effect of softening the shadow
          spreadRadius: 0.0,
          // has the effect of extending the shadow
          offset: Offset(0.0, 2.0),
        )
      ],
      borderRadius: BorderRadius.circular(15.0));

  static BoxDecoration bottomSheetBoxDecoration = BoxDecoration(
      color: Colors.white,
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.12),
          blurRadius: 16.0,
          // has the effect of softening the shadow
          spreadRadius: 5.0,
          // has the effect of extending the shadow
          offset: Offset(
            0.0, // horizontal, move right 10
            2.0, // vertical, move down 10
          ),
        )
      ],
      borderRadius: BorderRadius.only(
          topRight: Radius.circular(24.0), topLeft: Radius.circular(24.0)));

  static BoxDecoration specialAvatarDecoration = BoxDecoration(
      color: Colors.white,
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.12),
          blurRadius: 12.0,
          // has the effect of softening the shadow
          spreadRadius: 1.0,
          // has the effect of extending the shadow
          offset: Offset(4.0, 4.0),
        )
      ],
      borderRadius: BorderRadius.circular(30.0));

  static BoxDecoration specialMoreButtonDecoration = BoxDecoration(
      color: appPrimaryColor, borderRadius: BorderRadius.circular(8));
}
