import 'package:flutter/material.dart';


const kPrimaryColor = Color(0xFF386BF6);
const kSecondaryColor = Color(0xFF16DBCC);
const kContentColorLightTheme = Color(0xFF1D1D35);
const kContentColorDarkTheme = Color(0xFFF5FCF9);
const kErrorColor = Color(0xFFF03738);
const kWhiteColor = Color(0xFFFFFFFF);
const kBlackColor = Color(0xFF000000);
const kBackColor = Color(0xFFF7F7F7);

const kDefaultPadding = 20.0;
const kBottomNavigationBarHeight = kDefaultPadding * 2.8;

const kDefaultDuration = Duration(milliseconds: 250);

OutlineInputBorder defaultOutlineInputBorder = OutlineInputBorder(
  borderSide: BorderSide(
    color: kBlackColor.withOpacity(0.1),
    width: 1
  ),
  borderRadius: BorderRadius.all(Radius.circular(30)),
);