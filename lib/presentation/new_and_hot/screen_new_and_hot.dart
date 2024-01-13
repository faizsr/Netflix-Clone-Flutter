import 'package:flutter/material.dart';
import 'package:netflix_clone_project/presentation/new_and_hot/widgets/appbar.dart';
import 'package:netflix_clone_project/presentation/new_and_hot/widgets/coming_soon_card.dart';
import 'package:netflix_clone_project/presentation/new_and_hot/widgets/everyone_watching_card.dart';

class ScreenNewAndHot extends StatelessWidget {
  const ScreenNewAndHot({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(size.height * 0.115),
            child: const NewAndHotAppBar(),
          ),
          body: TabBarView(
            children: [
              _tabViewOne(context),
              _tavViewTwo(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _tabViewOne(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: 10,
      itemBuilder: (context, index) {
        return const ComingSoonCard();
      },
    );
  }

  Widget _tavViewTwo() {
    return ListView.builder(
      itemCount: 10,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return const EveryWatchCard();
      },
    );
  }
}
