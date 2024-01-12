import 'package:flutter/material.dart';
import 'package:netflix_clone_project/core/assets.dart';
import 'package:netflix_clone_project/core/constants.dart';
import 'package:netflix_clone_project/presentation/widgets/video_action_widget.dart';

class ComingSoonCard extends StatelessWidget {
  const ComingSoonCard({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * 0.58,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _newAndHotSideDate(size),
          SizedBox(
            // height: size.height * 0.6,
            width: size.width - 50,
            child: Column(
              children: [
                _newAndHotMainImage(),
                _cardDetails(size),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Padding _cardDetails(Size size) {
    return Padding(
      padding: const EdgeInsets.only(right: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Spacer(),
              VideoActionWidget(
                icon: notification,
                iconSize: 0.06,
                text: 'Remind Me',
                height: 0.006,
                textSize: 13,
                textColor: Colors.grey.shade600,
              ),
              kWidth(size.width * 0.08),
              VideoActionWidget(
                icon: info,
                iconSize: 0.055,
                text: 'Info',
                height: 0.007,
                textSize: 13,
                textColor: Colors.grey.shade600,
              ),
            ],
          ),
          const Text(
            'Season 3 coming on Friday',
            style: TextStyle(
              fontWeight: FontWeight.w100,
              fontSize: 16,
            ),
          ),
          kHeight(10),
          Image.asset(seriesLogo),
          const Text(
            'Ted',
            style:
                TextStyle(fontWeight: FontWeight.w600, fontSize: 18, height: 1),
          ),
          kHeight(10),
          Text(
            "Struggling to come to terms with his wife's death, a writer for a newspaper adopts a gruff new persona in an effort to push away those trying to help",
            style: TextStyle(
                fontWeight: FontWeight.w100,
                fontSize: 14,
                color: Colors.grey.shade600),
          )
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
        borderRadius: BorderRadius.circular(14),
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

  SizedBox _newAndHotSideDate(Size size) {
    return SizedBox(
      width: 50,
      // height: size.height * 0.6,
      child: Column(
        children: [
          Text(
            'JAN',
            style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w100,
                color: Colors.grey.shade600),
          ),
          const Text(
            '14',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w500,
              height: 1,
            ),
          )
        ],
      ),
    );
  }
}
