import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vvims/constants/constants.dart';
import 'package:vvims/screens/onbording/omboarding_screen.dart';
import 'package:vvims/theme.dart';
import 'package:vvims/utils/theme.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: kPrimaryColor,
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'VVIMS',
      theme: theme,
      home: const OnboardingView(),
     // home: const OnboardingScreen(),
    );
  }
}
