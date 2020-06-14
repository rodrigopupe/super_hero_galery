import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../models/super_hero_model.dart';

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
      leading: CachedNetworkImage(
        placeholder: (_, __) => Icon(Icons.image),
        imageUrl: superHero.image.url,
        errorWidget: (_, __, ___) => Icon(
          Icons.error,
          color: Theme.of(context).errorColor,
        ),
      ),
      trailing: Icon(Icons.arrow_forward_ios),
    );
  }
}
