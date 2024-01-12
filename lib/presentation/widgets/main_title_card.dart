import 'package:flutter/material.dart';
import 'package:netflix_clone_project/presentation/widgets/main_card.dart';
import 'package:netflix_clone_project/presentation/widgets/main_title.dart';

class MainTitleCard extends StatelessWidget {
  const MainTitleCard({
    super.key,
    required this.size,
    required this.title,
  });

  final Size size;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MainTitle(
            title: title,
          ),
          LimitedBox(
            maxHeight: 200,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: List.generate(
                10,
                (index) => MainCard(size: size),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
