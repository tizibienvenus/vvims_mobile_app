import 'package:flutter/material.dart';
import 'package:vvims/constants/constants.dart';
import 'package:vvims/screens/auth/components/header_section.dart';
import 'package:vvims/screens/auth/components/login_section.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //extendBodyBehindAppBar: true,
      backgroundColor: kPrimaryColor,
      //resizeToAvoidBottomInset: false,
      body: SafeArea(
        top: false,
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Positioned(child: Image.asset("assets/images/ornament.png")),
              Column(
                children: [const HeaderSection(), LoginSection()],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
