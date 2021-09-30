import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:try_starter/core/constant/language_constant.dart';

class AppLocalizations {
  AppLocalizations(
    this._locale, {
    this.isTest = false,
  });
  final Locale _locale;
  bool isTest;

  static AppLocalizations? of(BuildContext context) =>
      Localizations.of(context, AppLocalizations);

  late Map<String, String> _localizationString;

  ///* load Localizations to test mode
  ///
  Future<AppLocalizations> loadTest(Locale locale) async {
    return AppLocalizations(locale);
  }

  /// * load Localizations to production mode
  ///
  Future<bool> load() async {
    final jsonString =
        await rootBundle.loadString('assets/i18n/${_locale.languageCode}.json');
    final jsonMap = jsonDecode(jsonString) as Map<String, dynamic>;

    _localizationString =
        jsonMap.map((key, dynamic value) => MapEntry(key, value.toString()));

    return true;
  }

  String? translate(String key) {
    if (isTest) return key;

    return _localizationString[key];
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      AppLocalizationDelegate();
}

class AppLocalizationDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationDelegate({this.isTest = false});

  final bool isTest;

  @override
  bool isSupported(Locale locale) {
    return Languages.languages
        .map((e) => e.code)
        .toList()
        .contains(locale.languageCode);
  }

  @override
  Future<AppLocalizations> load(Locale locale) async {
    final localizations = AppLocalizations(locale, isTest: isTest);
    if (isTest) {
      await localizations.loadTest(locale);
    } else {
      await localizations.load();
    }
    return localizations;
  }

  @override
  bool shouldReload(covariant LocalizationsDelegate<AppLocalizations> old) {
    return false;
  }
}
