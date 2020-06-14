import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'src/controllers/home_controller.dart';
import 'src/repositories/super_hero_repository_impl.dart';
import 'src/utils/theme_utils.dart';
import 'src/pages/home_page.dart';

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
        home: HomePage(),
      ),
    );
  }
}
