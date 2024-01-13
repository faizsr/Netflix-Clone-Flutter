import 'package:flutter/material.dart';
import 'package:netflix_clone_project/core/colors.dart';
import 'package:netflix_clone_project/core/constants.dart';

class VideoActionWidget extends StatelessWidget {
  const VideoActionWidget({
    super.key,
    required this.icon,
    required this.text,
    this.iconSize,
    this.textColor,
    this.height,
    this.textSize,
  });

  final String icon;
  final double? iconSize;
  final double? height;
  final double? textSize;
  final String text;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.only(
        top: screenHeight * 0.03,
      ),
      child: Column(
        children: [
          PhysicalModel(
            color: Colors.transparent,
            elevation: 5,
            shadowColor: Colors.grey.withOpacity(0.5),
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              icon,
              width: screenWidth * iconSize!,
              color: kWhiteColor,
            ),
          ),
          kHeight(screenHeight * (height ?? 0.004)),
          Text(
            text,
            style: TextStyle(
              fontSize: textSize ?? 11,
              color: textColor ?? kWhiteColor,
            ),
          ),
        ],
      ),
    );
  }
}
