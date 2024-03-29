import 'package:flutter/material.dart';
import 'package:netflix_clone_project/core/string.dart';
import 'package:netflix_clone_project/presentation/home/widgets/listview_loading.dart';
import 'package:netflix_clone_project/presentation/home/widgets/number_card.dart';
import 'package:netflix_clone_project/presentation/widgets/main_title.dart';

class NumberTitleCard extends StatelessWidget {
  const NumberTitleCard({
    super.key,
    required this.size,
    required this.series,
  });

  final Size size;
  final Future<List<dynamic>> series;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const MainTitle(
            title: 'Top 10 TV shows Today',
          ),
          FutureBuilder(
              future: series,
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return ErrorLoading(size: size);
                } else if (snapshot.hasData) {
                  return LimitedBox(
                    maxHeight: 200,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: _generateList(snapshot),
                    ),
                  );
                } else {
                  return ListViewLoading(size: size);
                }
              }),
        ],
      ),
    );
  }

  List<Widget> _generateList(AsyncSnapshot snapshot) {
    return List.generate(
      10,
      (index) => NumberCard(
        index: index,
        size: size,
        image: imageBaseUrl + snapshot.data![index].posterPath,
      ),
    );
  }
}
