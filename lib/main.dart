import 'package:flutter/material.dart';
import 'package:vvims/screens/home.dart';
import 'package:vvims/theme.dart';

void main() {
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
      home: const Home(),
    );
  }
}
