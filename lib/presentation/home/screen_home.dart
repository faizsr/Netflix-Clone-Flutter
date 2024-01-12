import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:netflix_clone_project/core/constants.dart';
import 'package:netflix_clone_project/presentation/home/widgets/app_bar.dart';
import 'package:netflix_clone_project/presentation/home/widgets/home_banner.dart';
import 'package:netflix_clone_project/presentation/home/widgets/number_title_card.dart';
import 'package:netflix_clone_project/presentation/widgets/main_title_card.dart';

ValueNotifier<bool> scrollNotifier = ValueNotifier(true);

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: ValueListenableBuilder(
            valueListenable: scrollNotifier,
            builder: (context, index, _) {
              return NotificationListener<UserScrollNotification>(
                onNotification: (notification) {
                  final ScrollDirection direction = notification.direction;
                  // print(direction);
                  if (direction == ScrollDirection.reverse) {
                    scrollNotifier.value = false;
                  } else if (direction == ScrollDirection.forward) {
                    scrollNotifier.value = true;
                  }
                  return true;
                },
                child: Stack(
                  children: [
                    ListView(
                      children: [
                        const HomeBanner(),
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
                    scrollNotifier.value
                        ? HomeScreenAppbar(size: size)
                        : kHeight(0)
                  ],
                ),
              );
            }),
      ),
    );
  }
}
