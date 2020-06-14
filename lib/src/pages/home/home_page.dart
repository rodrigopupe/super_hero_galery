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
  TextEditingController _searchController;

  @override
  void initState() {
    _searchController = TextEditingController();
    super.initState();
  }

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
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    _locale.getString('search_box_label'),
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  SizedBox(height: 8.0),
                  TextField(
                    controller: _searchController,
                    keyboardType: TextInputType.text,
                    onChanged: _controller.updateFilter,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.search),
                      suffixIcon: IconButton(
                        icon: Icon(Icons.clear),
                        onPressed: () {
                          _searchController.clear();
                          _controller.updateFilter(_searchController.text);
                        },
                      ),
                      hintText: _locale.getString('search_box_hint'),
                    ),
                  )
                ],
              ),
            ),
            Observer(
              builder: (_) {
                Widget result;
                if (_controller.filteredList.isEmpty) {
                  if (_searchController.text.isNotEmpty) {
                    result = Center(
                        child: Text(
                      _locale.getString('no_super_hero_found'),
                      style: Theme.of(context).textTheme.headline4,
                    ));
                  } else {
                    result = Container();
                  }
                } else {
                  result = Observer(
                    builder: (_) => Expanded(
                      child: _drawList(_controller.filteredList),
                    ),
                  );
                }

                return result;
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _drawList(List<SuperHeroModel> superHeroes) {
    return ListView.separated(
      physics: BouncingScrollPhysics(),
      itemCount: superHeroes.length,
      separatorBuilder: (_, __) => Divider(),
      itemBuilder: (_, index) {
        final superHero = superHeroes[index];

        return SuperHeroItem(superHero: superHero);
      },
    );
  }
}
