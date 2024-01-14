import 'package:flutter/material.dart';
import 'package:netflix_clone_project/core/assets.dart';
import 'package:netflix_clone_project/presentation/fast_laugh/widgets/video_list_item.dart';

class ScreenFastLaugh extends StatelessWidget {
  const ScreenFastLaugh({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PageView(
          scrollDirection: Axis.vertical,
          children: List.generate(imageList.length, (index) {
            return VideoListItem(index: index,);
          }),
        ),
      ),
    );
  }
}
