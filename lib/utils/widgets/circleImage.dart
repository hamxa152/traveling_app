
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CircularCachedNetworkImage extends StatelessWidget {
  final String imageURL;
  final double height;
  final double width;
  final Color borderColor;
  final BoxFit fit;
  final double borderWidth;
  final BoxShape shape;
  final String errorImage;
  final double radius;

  const CircularCachedNetworkImage({
    super.key,
    required this.imageURL,
    required this.width,
    required this.height,
    required this.borderColor,
    this.fit = BoxFit.cover,
    this.borderWidth = 2,
    this.shape = BoxShape.circle,
    this.errorImage = '',
    this.radius = 300,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: borderColor,
        shape: shape,
      ),
      child: Padding(
        padding: EdgeInsets.all(borderWidth),
        child: Container(
          decoration: BoxDecoration(
            shape: shape,
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: const Color(0xff1A97D4).withOpacity(0.3),
                spreadRadius: 2,
                blurRadius: 20,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(radius)),
            child: CachedNetworkImage(
              imageUrl: imageURL,
              fit: fit,
              placeholder: (context, url) => const CupertinoActivityIndicator(),
              errorWidget: (context, url, error) =>
                  const CupertinoActivityIndicator(),
            ),
          ),
        ),
      ),
    );
  }
}
