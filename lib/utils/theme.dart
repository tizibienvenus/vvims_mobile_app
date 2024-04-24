import 'package:flutter/material.dart';
import 'package:vvims/config/app_colors.dart';

import '../constants/constants.dart';

ThemeData theme = ThemeData(
  primaryColor: AppColors.blue,
  hintColor: AppColors.blue,
  unselectedWidgetColor: AppColors.grey,
  fontFamily: 'Sk-Modernist',
  splashFactory: NoSplash.splashFactory,

  iconTheme: const IconThemeData(color: kContentColorLightTheme),
  colorScheme: const ColorScheme.light(
    primary: kPrimaryColor,
    secondary: kSecondaryColor,
    error: kErrorColor,
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: Colors.white,
    selectedItemColor: kContentColorLightTheme.withOpacity(0.7),
    unselectedItemColor: kContentColorLightTheme.withOpacity(0.32),
    selectedIconTheme: const IconThemeData(color: kPrimaryColor),
    showUnselectedLabels: false,
  ),
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: kWhiteColor,
    //fillColor: Color(0xFFF8F8F9),
    hintStyle: const TextStyle(
      color: Color(0xFFB8B5C3),
    ),
    border: defaultOutlineInputBorder,
    enabledBorder: defaultOutlineInputBorder,
    focusedBorder: defaultOutlineInputBorder,
  ),

  buttonTheme: ButtonThemeData(
    buttonColor: AppColors.blue,
    textTheme: ButtonTextTheme.primary,
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    padding: EdgeInsets.zero,
  ),
  appBarTheme:  AppBarTheme(
    color: Colors.transparent,
    elevation: 0,
    iconTheme: IconThemeData(
        color: AppColors.black
    ),
  ),

  bottomAppBarTheme: const BottomAppBarTheme(
    color: Colors.transparent,
    elevation: 0,
  ),

  textTheme: TextTheme(

    // main primary body text
    bodyLarge:  TextStyle(
      color: AppColors.black,
      fontFamily: 'Sk-Modernist',
      fontStyle: FontStyle.normal,
      fontSize: 14,
      fontWeight: FontWeight.w400,
    ),

    // secondary body text
    bodyMedium: TextStyle(
        color: AppColors.black,
        fontFamily: 'Sk-Modernist',
        height: 1.5,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w300,
        fontSize: 12
    ),

    // for all other headers
    // main heading text
    displayLarge: TextStyle(
      color: AppColors.black,
      fontFamily: 'Sk-Modernist',
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w700,
      letterSpacing: 1.2,
      fontSize: 26,
    ),

    // for all other headers
    displayMedium: TextStyle(
        color: AppColors.black,
        fontFamily: 'Sk-Modernist',
        fontStyle: FontStyle.normal,
        fontSize: 24,
        fontWeight: FontWeight.w700
    ),

    //
    displaySmall: TextStyle(
        color: AppColors.black,
        fontFamily: 'Sk-Modernist',
        fontStyle: FontStyle.normal,
        fontSize: 15,
        fontWeight: FontWeight.w600),

    // used for buttons
    headlineMedium: TextStyle(
        color: AppColors.black,
        fontFamily: 'Sk-Modernist',
        fontStyle: FontStyle.normal,
        fontSize: 15,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.4
    ),

    // label + caption
    headlineSmall: TextStyle(
        color: AppColors.black,
        fontFamily: 'Sk-Modernist',
        fontStyle: FontStyle.normal,
        fontSize: 14,
        fontWeight: FontWeight.w500
    ),

    //over line + button small
    titleLarge: TextStyle(
        color: AppColors.black,
        fontFamily: 'Sk-Modernist',
        fontStyle: FontStyle.normal,
        fontSize: 12,
        fontWeight: FontWeight.w700,
        letterSpacing: 1.1
    ),


  ),
  // colorScheme: ColorScheme(background: AppColors.blue.withOpacity(0.09)),
);