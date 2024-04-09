import 'package:flutter/material.dart';

class AppColors {
  AppColors._();
  static const mainColor = Color.fromARGB(255, 45, 129, 231);
  static const mainGreyColor = Color.fromARGB(202, 203, 203, 203);
  static const borderColor = Color.fromARGB(147, 71, 73, 74);
  static const lightBorderColor = Color.fromARGB(146, 120, 121, 122);
  static const fillCollor = Color.fromARGB(192, 229, 229, 229);
  static const Color blueColor = Color(0xFF2F39C5);
  static const shadowColor = Color.fromARGB(183, 158, 158, 158);
  static const whiteColor = Color.fromARGB(255, 255, 255, 255);
  static const transparentColor = Color.fromARGB(0, 255, 255, 255);
  static const blackColor = Colors.black;
  static const greyColor = Colors.grey;
  static const redColor = Colors.red;
  
  static const Gradient linearGradient = LinearGradient(
      begin: Alignment(0.0, 0.0),
      end: Alignment(0.707, -0.707),
      colors: [
        Color(0xffff9a9e),
        Color(0xfffad0c4),
        Color(0xfffad0c4),
      ]);
}
