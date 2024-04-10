import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vvims/constants/constants.dart';
import 'package:vvims/screens/home/home_screen.dart';
import 'package:vvims/screens/notifications/notifiactions.dart';
import 'package:vvims/screens/profile/profile.dart';
import 'package:vvims/screens/scan/scan_screen.dart';
import 'package:vvims/screens/visit_info/visit_info.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _ChatsState();
}

class _ChatsState extends State<Home> with SingleTickerProviderStateMixin {

  late AnimationController menuAnimation;
  IconData lastTapped = Icons.notifications;
  ValueNotifier<bool> isDialOpen = ValueNotifier(false);

  final List<IconData> menuItems = <IconData>[
    Icons.home,
    Icons.new_releases,
    Icons.notifications,
    Icons.settings,
    Icons.menu,
  ];

  void _updateMenu(IconData icon) {
    if (icon != Icons.menu) {
      setState(() => lastTapped = icon);
    }
  }

  @override
  void initState() {
    super.initState();
    menuAnimation = AnimationController(
      duration: const Duration(milliseconds: 250),
      vsync: this,
    );
  }


  int currentIndex = 0;

  List pages = [
    HomeScreen(),
    VisitInfosScreen(),
    HomeScreen(),
    NotificationsScreen(),
    ProfilScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      /* floatingActionButton: FloatingActionButton(
        hoverElevation: 0,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(kDefaultPadding * 5)),
        onPressed: (){},
        child: SvgPicture.asset("assets/icons/scanner.svg")
      ), */
      bottomNavigationBar: buildBottomNavigationBar(),
      floatingActionButton: buildFat(),
      body: pages[currentIndex],
    );
  }

  BottomNavigationBar buildBottomNavigationBar() {
    return BottomNavigationBar(
      elevation: 1,
      type: BottomNavigationBarType.fixed,
      //fixedColor: kPrimaryColor,
      currentIndex: currentIndex,
      enableFeedback: true,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      onTap: (value) {
        setState(() {
          if (value != 2) {
            currentIndex = value;
          }
        });
      },
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home_rounded), label: "Home"),
        BottomNavigationBarItem(icon: Icon(Icons.folder_rounded), label: "Folder"),
        BottomNavigationBarItem(icon: Icon(Icons.notifications_rounded , color: kWhiteColor,), label: "None"),
        BottomNavigationBarItem(icon: Icon(Icons.notifications_rounded,), label: "Notifications"),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_2_rounded),
          label: "Profile",
        ),
      ],
    );
  }

  SpeedDial buildFat(){
    return SpeedDial(
      icon: Icons.qr_code_scanner_outlined,
      //animatedIcon: AnimatedIcons.arrow_menu,
      openCloseDial: isDialOpen,
      backgroundColor: kPrimaryColor,
      overlayColor: Color(0xFF2C4364),
      overlayOpacity: 0.6,
      spacing: 0,
      elevation: 0,
      buttonSize: Size(56, 56),
      childrenButtonSize: Size(300, 60),
      spaceBetweenChildren: 5,
      closeManually: true,
      children: [
         SpeedDialChild(
          onTap: (){
            Navigator.push(
              context, 
              MaterialPageRoute(builder: (context) => ScanScreen(),)
            );
          },
          //backgroundColor: kWhiteColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50.0), // Customize the border radius as needed
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 5),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundColor: kSecondaryColor.withOpacity(0.1),
                  child: SvgPicture.asset("assets/icons/car.svg")), 
                const SizedBox(width: kDefaultPadding / 2,),
                Flexible(
                  child: Text(
                    "Scanner le passeport / CNI",
                    maxLines: 1,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                )
              ],
            ),
          ), 
        ),
        
        SpeedDialChild(
          //backgroundColor: kWhiteColor,
          onTap: (){
            Navigator.push(
              context, 
              MaterialPageRoute(builder: (context) => ScanScreen(),)
            );
          },
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50.0), // Customize the border radius as needed
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 5),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundColor: kSecondaryColor.withOpacity(0.1),
                  child: SvgPicture.asset("assets/icons/car.svg")), 
                const SizedBox(width: kDefaultPadding / 2,),
                Text(
                  "Scanner le Véhicule",
                  style: Theme.of(context).textTheme.bodyLarge,
                )
              ],
            ),
          ), 
        ),
       
      ],
    );
  }


}


