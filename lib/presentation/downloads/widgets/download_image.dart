import 'dart:math';

import 'package:flutter/material.dart';
import 'package:netflix_clone_project/core/colors/colors.dart';

class DownloadsImageWidget extends StatelessWidget {
  const DownloadsImageWidget({
    super.key,
    required this.height,
    required this.width,
    this.margin,
    this.angle,
    required this.imageList,
  });

  final double height;
  final double width;
  final EdgeInsetsGeometry? margin;
  final double? angle;
  final String imageList;

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: angle! * pi / 100,
      child: Container(
        margin: margin,
        height: height,
        width: width,
        // color: Colors.white,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          image: DecorationImage(
            image: NetworkImage(imageList),
            fit: BoxFit.cover,
          ),
          color: kWhiteColor,
        ),
      ),
    );
  }
}
