import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:vvims/utils/session.dart';

class Localization {
  static changeLocale(BuildContext context, locale) {
    Locale? currentLocal = EasyLocalization.of(context)!.currentLocale;
    if (currentLocal == const Locale('en', 'US')) {
      EasyLocalization.of(context)!.setLocale(const Locale('fr', 'FR'));
    } else {
      EasyLocalization.of(context)!.setLocale(const Locale('en', 'US'));
    }
  }

  static Future<bool> loadUserLocal(BuildContext context) async {
    bool locale = await SessionManager().getLocale();
    if (locale == true) {
      EasyLocalization.of(context)!.setLocale(const Locale('en', 'US'));
      return true;
    } else if (locale == false) {
      EasyLocalization.of(context)!.setLocale(const Locale('fr', 'FR'));
      return false;
    } else {
      EasyLocalization.of(context)!.setLocale(const Locale('en', 'US'));
      return true;
    }
  }

  static Future<void> setLocale(bool locale) async {
    await SessionManager().setLocale(locale);
  }
}
