import 'package:flutter/material.dart';
import 'package:rhyme_me/global/ui_assets/my_assets/colors.dart';

final darkTheme = ThemeData(
  useMaterial3: true,
  textTheme: textTheme,
  scaffoldBackgroundColor: AppColors.darkBackgroundColor,
  dividerTheme: const DividerThemeData(
    color: AppColors.dividerColor,
  ),
  colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.darkMainColor, brightness: Brightness.dark),
  primaryColor: AppColors.darkTabBarIconColor,
  secondaryHeaderColor: const Color.fromARGB(255, 0, 0, 0),
);

final lightTheme = ThemeData(
  useMaterial3: true,
  textTheme: textTheme,
  scaffoldBackgroundColor: AppColors.lightBackgroundColor,
  dividerTheme: const DividerThemeData(
    color: AppColors.dividerColor,
  ),
  colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.mainColor, brightness: Brightness.light),
  primaryColor: AppColors.mainColor,
  hintColor: AppColors.greyColor,
  secondaryHeaderColor: AppColors.mainColor,
);

const textTheme = TextTheme(
  titleMedium: TextStyle(
      fontSize: 18, fontWeight: FontWeight.w500, color: AppColors.blackColor),
  headlineLarge: TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.w600,
  ),
);
