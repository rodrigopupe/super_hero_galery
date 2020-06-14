import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import '../controllers/home_controller.dart';
import '../models/super_hero_model.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeController _controller;
  @override
  Widget build(BuildContext context) {
    _controller = Provider.of<HomeController>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('SuperHeroGalery'),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Observer(
        builder: (_) {
          if (_controller.superHeroList == null) {
            return Container();
          }

          Widget result;
          if (_controller.superHeroList.isEmpty) {
            result = CircularProgressIndicator();
          } else {
            result = _drawList(_controller.superHeroList);
          }

          return result;
        },
      ),
    );
  }

  Widget _drawList(List<SuperHeroModel> list) {
    return Text(list.length.toString());
  }
}
