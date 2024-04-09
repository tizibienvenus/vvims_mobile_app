import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vvims/constants/constants.dart';
import 'package:vvims/screens/home/home_screen.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _ChatsState();
}

class _ChatsState extends State<Home> {
  late ScrollController controller;
  int currentIndex = 0;

  List pages = [
    HomeScreen(),
    HomeScreen(),
    HomeScreen(),
    HomeScreen(),
    HomeScreen(),
  ];

  @override
  void initState() {
    super.initState();
    controller = ScrollController();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        hoverElevation: 0,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(kDefaultPadding * 5)),
        onPressed: (){},
        child: SvgPicture.asset("assets/icons/scanner.svg")
      ),
      bottomNavigationBar: buildBottomNavigationBar(),
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
          currentIndex = value;
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
}
