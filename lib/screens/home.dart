import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:vvims/config/app_colors.dart';
import 'package:vvims/constants/constants.dart';
import 'package:vvims/providers/bottom_navigation_provider.dart';
import 'package:vvims/screens/home/home_screen.dart';
import 'package:vvims/screens/notifications/notifiactions.dart';
import 'package:vvims/screens/profile/profile.dart';
import 'package:vvims/screens/scan/scan_screen.dart';
import 'package:vvims/screens/visit_info/visit_info.dart';

class Home extends StatefulWidget {
  const Home({super.key});

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
    const HomeScreen(),
    const VisitInfosScreen(),
    const NotificationsScreen(),
    const ProfilScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use
    return Consumer<BottomNavProvider>(builder: (_, provider, __) {
      return WillPopScope(
        onWillPop: () async {
          if (isDialOpen.value) {
            isDialOpen.value = false;
            return false;
          } else {
            return true;
          }
        },
        child: Scaffold(
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: InkWell(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ScanScreen(
                    title: "Scan Passport/ID Card",
                    index: 1,
                  ),
                )),
            child: Container(
              height: 65.h,
              width: 65.w,
              margin: EdgeInsets.symmetric(horizontal: 20.w),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(colors: [
                  Color(0xff7B9CF6),
                  Color(0xff184AD2),
                ]),
              ),
              child: Image.asset(
                "assets/icons/scanner.png",
                height: 30.h,
                width: 30.w,
              ),
            ),
          ),
          body: pages[provider.currentIndex],
          bottomNavigationBar: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: AppColors.grey.withOpacity(0.2),
                  offset: const Offset(0, -1),
                  blurRadius: 1,
                ),
              ],
            ),
            height: 60,
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                MaterialButton(
                  
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onPressed: () {
                      provider.updateIndex(0);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/icons/home.png",
                          height: 25,
                          width: 25,
                          // color: _currentIndex == 0 ? ColorUtils.Green :  ColorUtils.Black,
                        ),
                      ],
                    )),
                MaterialButton(
                    // minWidth: 60,
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onPressed: () {
                      provider.updateIndex(1);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/icons/folder.png",
                          height: 25,
                          width: 25,
                        ),
                      ],
                    )),
                MaterialButton(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onPressed: () {
                      provider.updateIndex(2);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/icons/notification.png",
                          height: 25,
                          width: 25,
                        ),
                      ],
                    )),
                MaterialButton(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onPressed: () {
                      provider.updateIndex(3);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/icons/profile.png",
                          height: 25,
                          width: 25,
                        ),
                      ],
                    )),
              ],
            ),
          ),
        ),
      );
    });
  }

  BottomNavigationBar buildBottomNavigationBar() {
    return BottomNavigationBar(
      elevation: 1,
      type: BottomNavigationBarType.fixed,
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
        BottomNavigationBarItem(
            icon: Icon(Icons.folder_rounded), label: "Folder"),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.notifications_rounded,
              color: kWhiteColor,
            ),
            label: "None"),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.notifications_rounded,
            ),
            label: "Notifications"),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_2_rounded),
          label: "Profile",
        ),
      ],
    );
  }
}
