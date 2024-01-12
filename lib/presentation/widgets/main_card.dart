import 'package:flutter/material.dart';
import 'package:netflix_clone_project/core/assets.dart';

class MainCard extends StatelessWidget {
  const MainCard({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      width: size.width * 0.35,
      height: size.height * 0.23,
      decoration: BoxDecoration(
          image: DecorationImage(
            image: Image.network(imageList[1]).image,
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(5)),
    );
  }
}
