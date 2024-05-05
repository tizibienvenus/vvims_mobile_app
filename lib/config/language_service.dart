import 'package:flutter/material.dart';
import 'package:vvims/config/locator.dart';
import 'package:vvims/config/storage_service.dart';

class LanguageService {
  // Locale get locale => loadLanguage();
  String get currentLanguage =>
      locator<StorageServices>().prefs.getString(language) ?? 'french';

  Future<void> setLocale(String lang) async {
    await locator<StorageServices>().prefs.setString(language, lang);
  }

  static const String language = 'language';
  static const String english = 'english';
  static const String french = 'french';

  static String get current =>
      locator<StorageServices>().prefs.getString(language) == 'french'
          ? 'fr'
          : WidgetsBinding.instance.window.locale.languageCode.contains('fr')
              ? 'fr'
              : 'en';

  // Locale loadLanguage() {
  //   final String? lang = locator<StorageServices>().prefs.getString(language);
  //   if (lang == null) {

  //     final deviceLanguageCode = deviceLocale.languageCode;
  //     final defaultLanguageCode = supportedLanguageCodes.contains(deviceLanguageCode)
  //         ? deviceLanguageCode
  //         : supportedLanguageCodes.first;

  //     return supportedLocales.firstWhere((locale) => locale.languageCode == defaultLanguageCode);
  //   } else {
  //     if (lang == english) {
  //       return S.delegate.supportedLocales
  //           .where((element) => element.languageCode == 'en')
  //           .toList()
  //           .first;
  //     } else {
  //       return S.delegate.supportedLocales
  //           .where((element) => element.languageCode == 'fr')
  //           .toList()
  //           .first;
  //     }
  //   }
  // }
}
