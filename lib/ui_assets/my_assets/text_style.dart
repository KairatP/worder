import 'package:flutter/material.dart';
import 'package:worder/ui_assets/my_assets/colors.dart';

class AppTextStyle {
  AppTextStyle._();
  static const appBarTextStyle = TextStyle(
      fontSize: 20, fontWeight: FontWeight.w500, color: AppColors.mainColor);
  static const appBarWhiteTextStyle = TextStyle(
      fontSize: 20, fontWeight: FontWeight.w500, color: AppColors.whiteColor);
  static const whiteBodyTextStyle = TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.normal,
      color: Color.fromARGB(210, 255, 255, 255));
  static const greyBodyTextStyle = TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.normal,
      color: Color.fromARGB(210, 110, 97, 97));
    static const blackBodyTextStyle = TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.normal,
      color: Color.fromARGB(255, 0, 0, 0),
    );
    static const redBodyTextStyle = TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.normal,
      color: Color.fromARGB(255, 255, 1, 1),
    );
    static const blueBodyTextStyle = TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.normal,
      color: AppColors.blueColor);
    static const mainBodyTextStyle = TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.normal,
      color: AppColors.mainColor);
  static const underlineBodyTextStyle = TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.normal,
      color: Color.fromARGB(210, 255, 255, 255),
      decoration: TextDecoration.underline,
      decorationColor: Colors.grey);
  static const appButtonTextStyle = TextStyle(
      fontSize: 16, fontWeight: FontWeight.normal, color: Colors.white);
  static const appButtonShadow = BoxShadow(
    color: AppColors.shadowColor,
    spreadRadius: 1,
    blurRadius: 2,
    offset: Offset(0, 2),
  );
}

TextStyle myTextStyle(double myFontSize) => TextStyle(
      fontSize: myFontSize,
    );
