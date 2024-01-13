import 'package:flutter/material.dart';
import 'package:netflix_clone_project/core/string.dart';
import 'package:netflix_clone_project/presentation/widgets/main_card.dart';
import 'package:netflix_clone_project/presentation/widgets/main_title.dart';

class MainTitleCard extends StatelessWidget {
  const MainTitleCard({
    super.key,
    required this.size,
    required this.title,
    required this.movies,
  });

  final Size size;
  final String title;
  final Future<List<dynamic>> movies;

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
                return LimitedBox(
                  maxHeight: 200,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: List.generate(
                      snapshot.data!.length,
                      (index) => MainCard(
                        size: size,
                        image: imageBaseUrl + snapshot.data![index].posterPath,
                      ),
                    ),
                  ),
                );
              } else {
                return const CircularProgressIndicator();
              }
            },
          ),
        ],
      ),
    );
  }
}
