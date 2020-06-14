import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:superherogalery/i18n/app_locale.dart';

import '../../controllers/home_controller.dart';
import '../../models/super_hero_model.dart';
import 'components/super_hero_item.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeController _controller;
  AppLocale _locale;
  @override
  Widget build(BuildContext context) {
    _controller = Provider.of<HomeController>(context);
    _locale = AppLocale.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(_locale.getString('app_title')),
        centerTitle: true,
        elevation: 0.0,
        actions: <Widget>[
          Observer(
            builder: (_) {
              if (_controller.busy) {
                return Center(child: CircularProgressIndicator());
              } else {
                return IconButton(
                  icon: Icon(Icons.refresh),
                  onPressed: _controller.getSuperHeroes,
                );
              }
            },
          ),
          SizedBox(width: 8.0),
          Observer(
            builder: (_) => Center(child: Text(_controller.superHeroList.length.toString())),
          )
        ],
      ),
      body: Observer(
        builder: (_) {
          Widget result;
          if (_controller.superHeroList.isEmpty) {
            result = Container();
          } else {
            result = _drawList(_controller.superHeroList);
          }

          return result;
        },
      ),
    );
  }

  Widget _drawList(List<SuperHeroModel> superHeroes) {
    return ListView.separated(
      itemCount: superHeroes.length,
      separatorBuilder: (_, __) => Divider(),
      itemBuilder: (_, index) {
        final superHero = superHeroes[index];

        return SuperHeroItem(superHero: superHero);
      },
    );
  }
}