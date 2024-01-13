import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:netflix_clone_project/core/constants.dart';
import 'package:shimmer/shimmer.dart';

class MainCard extends StatelessWidget {
  const MainCard({
    super.key,
    required this.size,
    required this.image,
  });

  final Size size;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      width: size.width * 0.35,
      height: size.height * 0.23,
      child: FutureBuilder(
          future: null,
          builder: (context, snapshot) {
            return CachedNetworkImage(
              imageUrl: image,
              imageBuilder: (context, imageProvider) => ClipRRect(
                borderRadius: BorderRadius.circular(5.0),
                child: Image(
                  image: imageProvider,
                  fit: BoxFit.cover,
                ),
              ),
              placeholder: (context, url) => Shimmer(
                gradient: shimmerGradient,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    color: Colors.black,
                  ),
                ),
              ),
            );
          }),
    );
  }
}
