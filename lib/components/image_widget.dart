import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ImageWidget extends StatelessWidget {
  final String? imageUrl;
  final BoxFit? fit;
  final BorderRadiusGeometry? borderRadius;
  final double? opacity;

  const ImageWidget({
    super.key,
    this.imageUrl,
    this.fit,
    this.borderRadius,
    this.opacity,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius ?? BorderRadius.zero,
      child: CachedNetworkImage(
        imageUrl: imageUrl ?? "http://via.placeholder.com/200x150",
        imageBuilder: (context, imageProvider) => ColorFiltered(
          colorFilter: ColorFilter.mode(
            Colors.black.withOpacity(opacity ?? 0.0),
            BlendMode.darken,
          ),
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: imageProvider,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        placeholder: (context, url) => SizedBox.expand(
            child: Container(
          color: Colors.grey[200],
          child: const Icon(
            Icons.image,
            color: Colors.white,
            size: 32,
          ),
        )),
        errorWidget: (context, url, error) => SizedBox.expand(
          child: Container(
            color: Colors.red[300],
            child: Icon(
              Icons.error_outline,
              color: Colors.grey[200],
              size: 32,
            ),
          ),
        ),
      ),
    );
  }
}
