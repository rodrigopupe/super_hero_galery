import 'strings_en.dart';
import 'strings_pt.dart';
import 'package:flutter/material.dart';

/*
    A cada novo idioma, deve-se mapeá-lo aqui
 */
class SupportedLanguages {
  static const LANGUAGES_MAP = {
    'en': ENGLISH,
    'pt': PORTUGUESE,
  };

  static List<String> get languages => LANGUAGES_MAP.keys.toList();

  static List<Locale> get supportedLocaleList {
    return languages.map((language) => Locale(language)).toList();
  }

  static Locale getResolutionCallback(
      Locale locale, Iterable<Locale> supportedLocales) {
    for (var supported in supportedLocales) {
      if (supported.languageCode == locale.languageCode) {
        return locale;
      }
    }

    return Locale(SupportedLanguages.languages.first);
  }
}
