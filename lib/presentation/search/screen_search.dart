import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix_clone_project/core/assets.dart';
import 'package:netflix_clone_project/core/constants.dart';
// import 'package:netflix_clone_project/presentation/search/widgets/screen_idle.dart';
import 'package:netflix_clone_project/presentation/search/widgets/search_result.dart';

class ScreenSearch extends StatelessWidget {
  const ScreenSearch({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(right: 5, left: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CupertinoSearchTextField(
                backgroundColor: const Color(0xFF323232),
                prefixInsets: EdgeInsetsDirectional.zero,
                suffixInsets: const EdgeInsetsDirectional.only(end: 10),
                prefixIcon: Container(
                  margin: const EdgeInsets.only(left: 10, right: 5),
                  width: 18,
                  child: Image.asset(
                    search,
                    color: const Color(0xFF737373),
                  ),
                ),
                suffixIcon: const Icon(
                  CupertinoIcons.xmark_circle_fill,
                  color: Color(0xFF737373),
                ),
                style: const TextStyle(
                  color: Color(0xFFE6E6E6),
                  letterSpacing: 0.3,
                ),
              ),
              kHeight(size.height * 0.01),
              // Expanded(
              //   child: SearchIdleWidget(),
              // ),
              const Expanded(
                child: SearchResultWidget(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
