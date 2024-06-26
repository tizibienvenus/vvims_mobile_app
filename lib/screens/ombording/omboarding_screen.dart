import 'package:flutter/material.dart';
import 'package:vvims/constants/constants.dart';
import 'package:vvims/screens/auth/login.dart';
import 'package:vvims/screens/ombording/components/dot_indicator.dart';
import 'package:vvims/screens/ombording/components/first_onbord.dart';
import 'package:vvims/screens/ombording/components/onboarding_content.dart';
import 'package:vvims/screens/ombording/components/second_onbord.dart';
import 'package:vvims/screens/ombording/components/third_onbord.dart';


class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}


class _OnboardingViewState extends State<OnboardingView> {
  int currentPage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        //itemCount: demoData.length,
        onPageChanged: (value) {
          setState(() {
            currentPage = value;
          });
        },
        children: const[
          FirstOnboardContent(position: 0),
          SecondOnboardContent(position: 1),
          ThirdOnboardContent(position: 2)
        ],
   ),

    );
  }
}