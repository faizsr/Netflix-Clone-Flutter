import 'package:flutter/material.dart';
import 'package:netflix_clone_project/core/assets.dart';
import 'package:netflix_clone_project/presentation/widgets/video_action_widget.dart';

class VideoListItem extends StatelessWidget {
  const VideoListItem({super.key, required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Colors.accents[index],
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  radius: 22,
                  backgroundColor: Colors.black,
                  child: InkWell(
                    onTap: () {},
                    child: Image.asset(
                      fastLaughVolumeMute,
                      color: Colors.white,
                      width: 22,
                    ),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CircleAvatar(
                      backgroundImage: Image.network(
                        imageList[1],
                        fit: BoxFit.cover,
                      ).image,
                    ),
                    VideoActionWidget(
                        icon: fastLaughEmoji, iconSize: 0.07, text: 'LOL'),
                    VideoActionWidget(
                        icon: fastLaughAdd, iconSize: 0.04, text: 'My List'),
                    VideoActionWidget(
                        icon: fastLaughShare, iconSize: 0.05, text: 'Share'),
                    VideoActionWidget(
                        icon: fastLaughPlay, iconSize: 0.05, text: 'Play')
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
