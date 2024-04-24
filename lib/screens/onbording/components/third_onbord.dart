import 'package:flutter/material.dart';
import 'package:vvims/constants/constants.dart';
import 'package:vvims/screens/auth/login.dart';

import 'dot_indicator.dart';

class ThirdOnboardContent extends StatelessWidget {
  const ThirdOnboardContent({
    super.key,
    required this.position
  });
  final int position;
 

  @override
  Widget build(BuildContext context) {
    var buttonStyle = ButtonStyle(
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
         RoundedRectangleBorder(
           borderRadius: BorderRadius.circular(50), 
           side: const BorderSide(color: kSecondaryColor, width: 1.0),
         ),
       ),
       padding: MaterialStateProperty.all<EdgeInsetsGeometry>(const EdgeInsets.all(0)),
       iconColor: MaterialStateColor.resolveWith((states) {
         if (states.contains(MaterialState.pressed)) {
           return kSecondaryColor;
         } else {
           return kSecondaryColor;
         }
       }),
     );
    return Scaffold(
     // backgroundColor: kPrimaryColor,
      body: Column(
      children: [
        const Spacer(),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.12),//kDefaultPadding * 2),
          child: AspectRatio(
            aspectRatio: 1,
            child: Image.asset("assets/images/car_onboard.png"),
          ),
        ),
        const SizedBox(height: 16),
        SizedBox(
          child: Column(
            children: [
              Container(
                width: 100,
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                decoration: const BoxDecoration(
                  color: kWhiteColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)
                  )
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    3,
                    (index) => DotIndicator(
                      inActiveColor: const Color(0xFF969FAB).withOpacity(0.2),
                      isActive: index == position,
                    ),
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding, vertical: 8),
                margin: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                decoration: BoxDecoration(
                  color: kWhiteColor,
                  borderRadius: BorderRadius.circular(20)
                ),
                child: Column(
                  children: [
                    const SizedBox(height: kDefaultPadding,),
                    Text(
                      "Capture automatique de la plaque d'immatriculation du véhicule",
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.titleMedium,

                    ),
                    const SizedBox(height: kDefaultPadding,),
                    const Text(
                      "Gérez les véhicules en scannant automatiquement les numéros de plaque d’immatriculation des véhicules et en gardant une trace de toutes les informations.",
                      textAlign: TextAlign.center,
                      //style: Theme.of(context).textTheme.labelSmall,
                    ),
                    const SizedBox(height: kDefaultPadding,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed: (){},
                          style: buttonStyle,
                          icon: const Icon(Icons.arrow_back),
                        ),
                        FilledButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateColor.resolveWith((states) {
                            if (states.contains(MaterialState.pressed)) {
                              return kSecondaryColor;
                            } else {
                              return kSecondaryColor;
                            }
                          }),
                          ),
                          onPressed: (){}, 
                          child: const Text("Scan Now")
                        ),
                        Transform.rotate(
                          angle: 3.15,
                          child: IconButton(
                          onPressed: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const LoginScreen())
                            );
                          },
                          style: buttonStyle,
                          icon: const Icon(
                            Icons.arrow_back,
                          ),
                        ),
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        const Spacer(),
      ],
    )
  );
  }
}