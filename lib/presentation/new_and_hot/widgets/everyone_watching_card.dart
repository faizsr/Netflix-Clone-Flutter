import 'package:flutter/material.dart';
import 'package:netflix_clone_project/core/assets.dart';
import 'package:netflix_clone_project/core/constants.dart';
import 'package:netflix_clone_project/presentation/widgets/video_action_widget.dart';

class EveryWatchCard extends StatelessWidget {
  const EveryWatchCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 5, right: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          kHeight(10),
          Image.asset(filmLogo),
          const Text(
            'Ted',
            style:
                TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
          ),
          kHeight(10),
          Text(
            "Struggling to come to terms with his wife's death, a writer for a newspaper adopts a gruff new persona in an effort to push away those trying to help",
            style: TextStyle(
              fontWeight: FontWeight.w100,
              fontSize: 14,
              color: Colors.grey.shade600,
            ),
          ),
          kHeight(30),
          _newAndHotMainImage(),
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: Row(
              children: [
                const Spacer(),
                VideoActionWidget(
                  icon: fastLaughShare,
                  iconSize: 0.05,
                  text: 'Share',
                  textSize: 13,
                  height: 0.01,
                  textColor: Colors.grey.shade500,
                ),
                kWidth(20),
                VideoActionWidget(
                  icon: fastLaughAdd,
                  iconSize: 0.05,
                  text: 'My List',
                  textSize: 13,
                  height: 0.01,
                  textColor: Colors.grey.shade500,
                ),
                kWidth(25),
                VideoActionWidget(
                  icon: fastLaughPlay,
                  iconSize: 0.05,
                  text: 'Play',
                  textSize: 13,
                  height: 0.01,
                  textColor: Colors.grey.shade500,
                )
              ],
            ),
          ),
          kHeight(10),
        ],
      ),
    );
  }

  Container _newAndHotMainImage() {
    return Container(
      width: double.infinity,
      height: 200,
      decoration: BoxDecoration(
        color: Colors.grey,
        image: const DecorationImage(
          image: NetworkImage(
            newAndHotTempImage,
          ),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 10,
            left: 10,
            child: Image.asset(
              logo,
              width: 16,
            ),
          ),
          Positioned(
            bottom: 10,
            right: 10,
            child: CircleAvatar(
              radius: 18,
              backgroundColor: Colors.black,
              child: InkWell(
                onTap: () {},
                child: Image.asset(
                  fastLaughVolumeMute,
                  color: Colors.white,
                  width: 18,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
