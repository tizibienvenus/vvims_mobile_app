import 'package:flutter/material.dart';
import 'package:vvims/constants/constants.dart';

import 'dot_indicator.dart';

class SecondOnboardContent extends StatelessWidget {
  const SecondOnboardContent({
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
            child: Image.asset("assets/images/user_onboard.png"),
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
                      "Scanner les cartes d’identité/passeports des visiteurs",
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.titleMedium,

                    ),
                    const SizedBox(height: kDefaultPadding,),
                    const Text(
                      "Gérez les visiteurs en scannant les cartes d’identité ou les passeports et en extrayant les informations sur les visiteurs.",
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
                          onPressed: (){},
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