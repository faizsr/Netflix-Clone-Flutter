import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:netflix_clone_project/core/constants.dart';
import 'package:netflix_clone_project/core/string.dart';
import 'package:netflix_clone_project/domain/model/movies.dart';
import 'package:netflix_clone_project/presentation/search/widgets/screen_list_tile.dart';
import 'package:netflix_clone_project/presentation/search/widgets/search_title.dart';

class SearchIdleWidget extends StatelessWidget {
  const SearchIdleWidget({
    super.key,
    required this.popularSearches,
  });

  final Future<List<Movie>> popularSearches;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SearchTextTitle(title: 'Popular Searches'),
        FutureBuilder(
          future: popularSearches,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return const Text('Error loading');
            } else if (snapshot.hasData) {
              return Expanded(
                child: ListView.separated(
                  shrinkWrap: true,
                  padding: const EdgeInsets.only(top: 0),
                  itemBuilder: (context, index) => PopularSearchItemTile(
                    imageList:
                        imageBaseUrl + snapshot.data![index].backdropPath,
                    movieName: snapshot.data![index].title,
                  ),
                  separatorBuilder: (context, index) => kHeight(10),
                  itemCount: snapshot.data!.length,
                ),
              );
            } else {
              return SpinKitFadingCircle(
                itemBuilder: (BuildContext context, int index) {
                  return DecoratedBox(
                    decoration: BoxDecoration(
                      color: index.isEven ? Colors.red : Colors.green,
                    ),
                  );
                },
              );
            }
          },
        )
      ],
    );
  }
}
