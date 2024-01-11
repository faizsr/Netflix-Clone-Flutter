import 'package:flutter/material.dart';
import 'package:netflix_clone_project/core/assets.dart';
import 'package:netflix_clone_project/core/constants.dart';

class AppBarWidget extends StatelessWidget {
  final String appbarTitle;
  const AppBarWidget({
    super.key,
    required this.appbarTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Row(
        children: [
          Text(
            appbarTitle,
            style: const TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.w700,
              letterSpacing: 0.5,
            ),
          ),
          const Spacer(),
          SizedBox(
            width: 25,
            child: Image.asset(
              screenCast,
              color: Colors.white,
            ),
          ),
          kWidth(MediaQuery.of(context).size.height * 0.02),
          SizedBox(
            width: 25,
            child: Image.asset(
              profile,
              fit: BoxFit.fill,
            ),
          )
        ],
      ),
    );
  }
}
