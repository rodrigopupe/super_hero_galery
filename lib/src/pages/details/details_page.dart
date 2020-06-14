import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:superherogalery/src/models/super_hero_model.dart';
import 'package:superherogalery/src/shared/custom_cached_network_image.dart';

class DetailsPage extends StatefulWidget {
  final SuperHeroModel superHero;

  const DetailsPage({Key key, @required this.superHero}) : super(key: key);

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Theme.of(context).backgroundColor,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Theme.of(context).colorScheme.onBackground),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 16.0, bottom: 16.0),
            child: Text(
              widget.superHero.name,
              style: Theme.of(context).textTheme.headline1,
            ),
          ),
          Hero(
            tag: widget.superHero.id,
            child: Align(
              alignment: Alignment.center,
              child: CustomCachedNetworkImage(
                width: size.height * 0.35,
                height: size.height * 0.35,
                imageUrl: widget.superHero.image.url,
              ),
            ),
          )
        ],
      ),
    );
  }
}
