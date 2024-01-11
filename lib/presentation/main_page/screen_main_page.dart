import 'package:flutter/material.dart';
import 'package:icon_forest/flat_icons_medium.dart';
import 'package:netflix_clone_project/core/colors/colors.dart';
import 'package:netflix_clone_project/presentation/main_page/widgets/bottom_nav.dart';

class ScreenMainPage extends StatelessWidget {
  const ScreenMainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Center(
          child: Icon(FlatIconsMedium.home),
        ),
      ),
      bottomNavigationBar: BottomNavigationWidget(),
    );
  }
}
