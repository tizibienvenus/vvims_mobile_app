import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vvims/constants/constants.dart';

ThemeData lightThemeData(BuildContext context) {
  return ThemeData.light().copyWith(
    useMaterial3: true,
    primaryColor: kPrimaryColor,
    scaffoldBackgroundColor: kBackColor,//Colors.white,
    appBarTheme: appBarTheme,
    iconTheme: const IconThemeData(color: kContentColorLightTheme),
    textTheme: GoogleFonts.interTextTheme(Theme.of(context).textTheme)
    .apply(bodyColor: kContentColorLightTheme)
    .copyWith(
      // Utilisez Montserrat pour le style de corps
      bodyText1: GoogleFonts.montserrat(
        textStyle: Theme.of(context).textTheme.bodyText1,
      ),
      // Vous pouvez également ajouter d'autres styles de texte si nécessaire, par exemple :
      headline1: GoogleFonts.montserrat(
        textStyle: Theme.of(context).textTheme.headline1,
      ),
      // Ajoutez d'autres styles de texte selon vos besoins
    ),

    /* textTheme: GoogleFonts.interTextTheme(Theme.of(context).textTheme)
        .apply(bodyColor: kContentColorLightTheme), */
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
  );
}

const appBarTheme = AppBarTheme(centerTitle: false, elevation: 0);
