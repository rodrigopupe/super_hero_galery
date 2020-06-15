import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomCachedNetworkImage extends StatelessWidget {
  final String imageUrl;
  final double width;
  final double height;
  final BoxFit fit;

  const CustomCachedNetworkImage({
    Key key,
    this.imageUrl,
    this.width,
    this.height,
    this.fit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      width: this.width,
      height: this.height,
      placeholder: (_, __) => Icon(Icons.image),
      imageUrl: this.imageUrl,
      fit: this.fit,
      errorWidget: (_, __, ___) => Icon(
        Icons.error,
        color: Theme.of(context).errorColor,
      ),
    );
  }
}
