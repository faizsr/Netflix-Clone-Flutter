import 'package:flutter/material.dart';
import 'package:netflix_clone_project/presentation/downloads/widgets/screen_downloads.dart';
import 'package:netflix_clone_project/presentation/fast_laugh/screen_fast_laugh.dart';
import 'package:netflix_clone_project/presentation/home/screen_home.dart';
import 'package:netflix_clone_project/presentation/main_page/widgets/bottom_nav.dart';
import 'package:netflix_clone_project/presentation/new_and_hot/screen_new_and_hot.dart';
import 'package:netflix_clone_project/presentation/search/screen_search.dart';

class ScreenMainPage extends StatelessWidget {
  ScreenMainPage({super.key});

  final pages = [
    const ScreenHome(),
    const ScreenNewAndHot(),
    const ScreenFastLaugh(),
    const ScreenSearch(),
    const ScreenDownloads(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder(
        valueListenable: indexChangeNotifier,
        builder: (context, int index, child) {
          return pages[index];
        },
      ),
      bottomNavigationBar: const BottomNavigationWidget(),
    );
  }
}
