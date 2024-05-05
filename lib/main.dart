import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:vvims/config/app_colors.dart';
import 'package:vvims/config/locator.dart';
import 'package:vvims/config/permision_service.dart';
import 'package:vvims/constants/constants.dart';
import 'package:vvims/providers/bottom_navigation_provider.dart';
import 'package:vvims/providers/notification_provider.dart';
import 'package:vvims/providers/user_provider.dart';
import 'package:vvims/providers/visitors_provider.dart';
import 'package:vvims/screens/onbording/omboarding_screen.dart';
import 'package:vvims/utils/theme.dart';

void main() async {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: kPrimaryColor,
  ));
  WidgetsFlutterBinding.ensureInitialized();
  await setupInitialLocator();
  await EasyLocalization.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]);

  await PermissionsService.locationPermission();
  await Permission.notification.isDenied.then((value) {
    if (value) {
      Permission.notification.request();
    }
  });

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
      statusBarColor: AppColors.blue, statusBarBrightness: Brightness.light));

  runApp(EasyLocalization(
      supportedLocales: const [Locale("en", "US"), Locale("fr", "FR")],
      path: 'assets/translations',
      fallbackLocale: const Locale('en', 'US'),
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<UserProvider>(create: (_) => UserProvider()),
        ChangeNotifierProvider<NotificationProvider>(
            create: (_) => NotificationProvider()),
        ChangeNotifierProvider<VisitorProvider>(
            create: (_) => VisitorProvider()),
        ChangeNotifierProvider<BottomNavProvider>(
            create: (_) => BottomNavProvider()),
      ],
      child: ScreenUtilInit(
        designSize: const Size(360, 800),
        minTextAdapt: true,
        splitScreenMode: true,
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'VVIMS',
          theme: theme,
          home: const OnboardingView(),
        ),
      ),
    );
  }
}
