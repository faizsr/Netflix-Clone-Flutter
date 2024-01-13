import 'package:flutter/material.dart';
import 'package:netflix_clone_project/core/constants.dart';
import 'package:shimmer/shimmer.dart';

class ListViewLoading extends StatelessWidget {
  const ListViewLoading({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return LimitedBox(
      maxHeight: 200,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: List.generate(
          10,
          (index) => Container(
            margin: const EdgeInsets.only(right: 10),
            width: size.width * 0.35,
            height: size.height * 0.23,
            child: Shimmer(
              gradient: shimmerGradient,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
