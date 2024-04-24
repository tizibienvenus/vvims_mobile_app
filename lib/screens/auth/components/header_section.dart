import 'package:flutter/material.dart';
import 'package:vvims/constants/constants.dart';

class HeaderSection extends StatelessWidget {
  const HeaderSection({super.key});

  
  @override
  Widget build(BuildContext context){
    return Container(
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top * 3,
        left: kDefaultPadding,
        right: kDefaultPadding
      ),
      child: Column(
        children: [
          Text(
            "Bienvenue",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleLarge!.copyWith(color: kWhiteColor, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: kDefaultPadding,),
          const Text(
            "Connectez-vous à votre compte en saisissant votre adresse e-mail et votre mot de passe ci-dessous. Heureux de vous revoir.",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: kWhiteColor
            ),
          ),
        ],
      ),
    );
  }
}