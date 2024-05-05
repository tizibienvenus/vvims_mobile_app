import 'package:flutter/material.dart';
import 'package:vvims/constants/constants.dart';
import 'package:vvims/screens/home.dart';

class LoginSection extends StatelessWidget {
  late TextEditingController idController = TextEditingController();
  late TextEditingController passWordontroller = TextEditingController();

  LoginSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.7,
      constraints: const BoxConstraints(maxHeight: 800, minHeight: 450),
      padding: const EdgeInsets.symmetric(
          vertical: kDefaultPadding, horizontal: kDefaultPadding),
      margin: const EdgeInsets.only(
        top: kDefaultPadding * 5,
      ),
      decoration: const BoxDecoration(
        color: kWhiteColor,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        children: [
          const SizedBox(height: 50),
          TextFormField(
            controller: idController,
            keyboardType: TextInputType.text,
            inputFormatters: const [
              //UpperCaseTextFormatter()
            ],
            decoration: InputDecoration(
                hintText: "Full Name",
                prefixIcon: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Icon(
                    Icons.person_2_rounded,
                    color: kBlackColor.withOpacity(0.2),
                  ),
                ),
                contentPadding:
                    const EdgeInsets.symmetric(vertical: kDefaultPadding / 1.2)),
          ),
          const SizedBox(
            height: kDefaultPadding,
          ),
          TextFormField(
            controller: idController,
            keyboardType: TextInputType.text,
            inputFormatters: const [
              //UpperCaseTextFormatter()
            ],
            decoration: InputDecoration(
                hintText: "Full Name",
                prefixIcon: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Icon(
                    Icons.remove_red_eye_outlined,
                    color: kBlackColor.withOpacity(0.2),
                  ),
                ),
                contentPadding:
                    const EdgeInsets.symmetric(vertical: kDefaultPadding / 1.2)),
          ),
          //const SizedBox(height: kDefaultPadding / 8,),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                  style: ButtonStyle(
                    overlayColor: MaterialStateColor.resolveWith((states) {
                      // Définir la couleur d'overlay pour chaque état du bouton
                      if (states.contains(MaterialState.hovered)) {
                        return kPrimaryColor.withOpacity(
                            0); // Couleur d'overlay lorsque le bouton est survolé
                      }
                      return kPrimaryColor.withOpacity(
                          0); // Par défaut, aucune couleur d'overlay
                    }),
                    surfaceTintColor: MaterialStateColor.resolveWith((states) {
                      // Définir la couleur de surface pour chaque état du bouton
                      if (states.contains(MaterialState.disabled)) {
                        return kPrimaryColor.withOpacity(
                            0); // Couleur de surface lorsque le bouton est désactivé avec une opacité de 50%
                      }
                      return kPrimaryColor
                          .withOpacity(0); // Couleur de surface par défaut
                    }),
                  ),
                  onPressed: () {},
                  child: const Text("Mot de passe oublié ?"))
            ],
          ),
          Row(
            children: [
              Expanded(
                child: FilledButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateColor.resolveWith((states) {
                      if (states.contains(MaterialState.pressed)) {
                        return kSecondaryColor;
                      } else {
                        return kSecondaryColor;
                      }
                    }),
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const Home()));
                  },
                  child: const Text("Connectez-vous"),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
