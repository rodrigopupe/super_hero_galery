import 'supported_languages.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AppLocale {
  final Locale locale;

  AppLocale(this.locale);

  static LocalizationsDelegate<AppLocale> delegate = AppLocaleDelegate();

  static AppLocale of(BuildContext context) {
    return Localizations.of(context, AppLocale);
  }

  String getString(String key) {
    return SupportedLanguages.LANGUAGES_MAP[locale.languageCode][key];
  }
}

class AppLocaleDelegate extends LocalizationsDelegate<AppLocale> {
  const AppLocaleDelegate();

  @override
  bool isSupported(Locale locale) {
    return SupportedLanguages.languages.contains(locale.languageCode);
  }

  @override
  Future<AppLocale> load(Locale locale) {
    return SynchronousFuture<AppLocale>(AppLocale(locale));
  }

  @override
  bool shouldReload(LocalizationsDelegate<AppLocale> old) => false;
}