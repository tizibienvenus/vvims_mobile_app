import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vvims/constants/constants.dart';
import 'package:vvims/screens/home.dart';
import 'package:vvims/screens/ombording/components/first_onbord.dart';
import 'package:vvims/screens/ombording/components/second_onbord.dart';
import 'package:vvims/screens/ombording/omboarding_screen.dart';
import 'package:vvims/screens/scan/scan_screen.dart';
import 'package:vvims/theme.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: kPrimaryColor, // Rendre la barre de statut transparente
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: lightThemeData(context),
      home: ScanScreen(),
     // home: const OnboardingScreen(),
    );
  }
}
