import 'dart:ui';

import 'package:flutter/material.dart';

import '../../../shared/custom_cached_network_image.dart';

class SuperHeroHeader extends StatelessWidget {
  final String imageURL;
  final String name;
  final String superHeroId;

  const SuperHeroHeader({
    Key key,
    this.imageURL,
    this.name,
    this.superHeroId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      child: Stack(
        children: <Widget>[
          Opacity(
            opacity: 0.2,
            child: CustomCachedNetworkImage(
              fit: BoxFit.cover,
              width: size.width,
              height: size.height * 0.35,
              imageUrl: imageURL,
            ),
          ),
          Container(
            width: size.width,
            height: size.height * 0.35,
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
              child: Container(
                color: Colors.black.withOpacity(0.1),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 48.0),
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Text(
                    name,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headline1.copyWith(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
                Hero(
                  tag: superHeroId,
                  child: ClipOval(
                    child: CustomCachedNetworkImage(
                      width: size.height * 0.25,
                      height: size.height * 0.25,
                      imageUrl: imageURL,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            left: size.width * 0.03,
            top: size.height * 0.02,
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: IconButton(
                icon: Icon(Icons.arrow_back_ios, color: Theme.of(context).accentColor),
                onPressed: () => Navigator.pop(context),
              ),
            ),
          )
        ],
      ),
    );
  }
}
