import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import '../../../i18n/app_locale.dart';
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
      body: SafeArea(
        child: Container(
          color: Theme.of(context).scaffoldBackgroundColor,
          child: Column(
            children: <Widget>[
              Container(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            _locale.getString('app_title'),
                            style: Theme.of(context)
                                .textTheme
                                .headline2
                                .copyWith(fontWeight: FontWeight.w900),
                          ),
                          Observer(
                            builder: (_) => Row(
                              children: <Widget>[
                                Text(
                                  _locale
                                      .getString('super_heroes_count_label')
                                      .replaceAll('<#1>', _controller.superHeroesCount),
                                  style: Theme.of(context).textTheme.caption,
                                ),
                                _controller.busy
                                    ? Container()
                                    : IconButton(
                                        icon: Icon(Icons.refresh),
                                        onPressed: _controller.getSuperHeroes,
                                      ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 16.0),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: TextField(
                            controller: _searchController,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              suffixIcon: IconButton(
                                icon: Icon(Icons.clear),
                                onPressed: () {
                                  _searchController.clear();
                                  _controller.updateFilter(_searchController.text);
                                },
                              ),
                              hintText: _locale.getString('search_box_hint'),
                            ),
                          ),
                        ),
                        SizedBox(width: 16.0),
                        FloatingActionButton(
                          child: Icon(Icons.search),
                          backgroundColor: Theme.of(context).primaryColor,
                          foregroundColor: Theme.of(context).accentColor,
                          onPressed: () => _controller.updateFilter(_searchController.text),
                        )
                      ],
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
      ),
    );
  }

  Widget _drawList(List<SuperHeroModel> superHeroes) {
    return ListView.separated(
      physics: BouncingScrollPhysics(),
      itemCount: superHeroes.length,
      separatorBuilder: (_, __) => Divider(),
      itemBuilder: (_, index) => SuperHeroItem(
        superHero: superHeroes[index],
      ),
    );
  }
}
