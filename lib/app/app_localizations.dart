
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/*
AppLocalizations is used for internationalization.
Multi language support.
 */
class AppLocalizations {

  /*
  Init object with locale value
   */
  final Locale locale;
  AppLocalizations(this.locale);

  /*
  To get current localization used in app
   */
  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  /*
  AppDelegate instance created
   */
  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  late Map<String, String> _localizedStrings;

  /*
  Load locale files
   */
  Future<bool> load() async {
    String jsonString =
    await rootBundle.loadString('assets/language/${locale.languageCode}.json');
    Map<String, dynamic> jsonMap = json.decode(jsonString);

    _localizedStrings = jsonMap.map((key, value) {
      return MapEntry(key, value.toString());
    });

    return true;
  }

  /*
  Translate the the String
   */
  String? translate(String key) {
    return _localizedStrings[key];
  }

}

/*
AppDelegate class is to create LocalizationsDelegate to load and instance the supported locales.
 */
class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  /*
   add all languages code here
   */
  @override
  bool isSupported(Locale locale) {
    return ['en', 'ta'].contains(locale.languageCode);
  }

  /*
   load all localization files
   */
  @override
  Future<AppLocalizations> load(Locale locale) async {
    AppLocalizations localizations = AppLocalizations(locale);
    await localizations.load();
    return localizations;
  }

  @override
  bool shouldReload(LocalizationsDelegate<AppLocalizations> old) => false;
}