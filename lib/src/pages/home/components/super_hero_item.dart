import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:superherogalery/src/pages/details/details_page.dart';
import 'package:superherogalery/src/shared/custom_cached_network_image.dart';

import '../../../models/super_hero_model.dart';

class SuperHeroItem extends StatelessWidget {
  final SuperHeroModel superHero;

  const SuperHeroItem({
    Key key,
    @required this.superHero,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(superHero.name),
      leading: Hero(
        tag: superHero.id,
        child: CustomCachedNetworkImage(
          imageUrl: superHero.image.url,
        ),
      ),
      trailing: Icon(Icons.arrow_forward_ios),
      onTap: () => Navigator.push(
        context,
        CupertinoPageRoute(
          builder: (_) => DetailsPage(
            superHero: superHero,
          ),
        ),
      ),
    );
  }
}
