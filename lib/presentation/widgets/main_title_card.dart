import 'package:flutter/material.dart';
import 'package:netflix_clone_project/core/string.dart';
import 'package:netflix_clone_project/presentation/home/widgets/listview_loading.dart';
import 'package:netflix_clone_project/presentation/widgets/main_card.dart';
import 'package:netflix_clone_project/presentation/widgets/main_title.dart';

class MainTitleCard extends StatelessWidget {
  const MainTitleCard({
    super.key,
    required this.size,
    required this.title,
    required this.movies,
    this.reversed = false,
  });

  final Size size;
  final String title;
  final Future<List<dynamic>> movies;
  final bool reversed;

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
          FutureBuilder(
            future: movies,
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return const Text('Error loading');
              } else if (snapshot.hasData) {
                List<Widget> generatedList = List.generate(
                  snapshot.data!.length,
                  (index) => MainCard(
                    size: size,
                    image: imageBaseUrl + snapshot.data![index].posterPath,
                  ),
                );

                if (reversed) {
                  generatedList = generatedList.reversed.toList();
                }

                return LimitedBox(
                  maxHeight: 200,
                  child: ListView( 
                    scrollDirection: Axis.horizontal,
                    children: generatedList,
                  ),
                );
              } else {
                return ListViewLoading(size: size);
              }
            },
          ),
        ],
      ),
    );
  }
}
