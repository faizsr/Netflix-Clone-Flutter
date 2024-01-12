import 'package:flutter/material.dart';
import 'package:netflix_clone_project/presentation/home/widgets/number_card.dart';
import 'package:netflix_clone_project/presentation/widgets/main_title.dart';

class NumberTitleCard extends StatelessWidget {
  const NumberTitleCard({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const MainTitle(
            title: 'Top 10 TV shows in India Today',
          ),
          LimitedBox(
            maxHeight: 200,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: List.generate(
                15,
                (index) => NumberCard(size: size, index: index,),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
