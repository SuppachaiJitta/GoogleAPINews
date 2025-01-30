import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CustomNetWorkImage extends StatelessWidget {
  final String? imageUrl;
  final double? width;
  final double? height;

  CustomNetWorkImage({
    super.key,
    this.imageUrl,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return imageUrl == null || imageUrl!.isEmpty
        ? Image.asset(
            'assets/image/no_image.png',
            width: width ?? 100,
            height: height ?? 100,
            fit: BoxFit.contain,
          )
        : CachedNetworkImage(
            imageUrl: imageUrl!,
            width: width ?? 100,
            height: height ?? 100,
            fit: BoxFit.contain,
            placeholder: (context, url) => const Center(
              child: CircularProgressIndicator(),
            ),
            errorWidget: (context, url, error) => Image.asset(
              'assets/image/no_image.png',
              width: width ?? 100,
              height: height ?? 100,
              fit: BoxFit.contain,
            ),
          );
  }
}
