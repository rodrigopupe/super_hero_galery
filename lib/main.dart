import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

import 'i18n/app_locale.dart';
import 'i18n/supported_languages.dart';
import 'src/controllers/home_controller.dart';
import 'src/pages/home/home_page.dart';
import 'src/repositories/super_hero_repository_impl.dart';
import 'src/utils/theme_utils.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (_) => HomeController(SuperHeroRepositoryImpl())),
      ],
      child: MaterialApp(
        title: 'SuperHero Galery',
        debugShowCheckedModeBanner: false,
        theme: appTheme,
        localizationsDelegates: [
          AppLocale.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: SupportedLanguages.supportedLocaleList,
        localeResolutionCallback: SupportedLanguages.getResolutionCallback,
        home: HomePage(),
      ),
    );
  }
}
