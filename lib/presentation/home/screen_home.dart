import 'package:flutter/material.dart';
import 'package:netflix_clone_project/presentation/home/widgets/number_title_card.dart';
import 'package:netflix_clone_project/presentation/widgets/main_title_card.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            MainTitleCard(
              size: size,
              title: 'Released in the past year',
            ),
            MainTitleCard(
              size: size,
              title: 'Trending Now',
            ),
            NumberTitleCard(size: size),
            MainTitleCard(
              size: size,
              title: 'Tense Dramas',
            ),
            MainTitleCard(
              size: size,
              title: 'South Indian Cinemas',
            ),
          ],
        ),
      ),
    );
  }
}

