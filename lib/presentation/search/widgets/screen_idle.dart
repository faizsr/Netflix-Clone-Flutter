import 'package:flutter/material.dart';
import 'package:netflix_clone_project/core/assets.dart';
import 'package:netflix_clone_project/core/constants.dart';
import 'package:netflix_clone_project/core/string.dart';
import 'package:netflix_clone_project/domain/model/movies.dart';
import 'package:netflix_clone_project/presentation/search/widgets/screen_list_tile.dart';
import 'package:netflix_clone_project/presentation/search/widgets/search_title.dart';
import 'package:shimmer/shimmer.dart';

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
              return _loadingWidget(context: context);
            }
          },
        )
      ],
    );
  }

  _loadingWidget({context}) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Expanded(
      child: ListView.separated(
        shrinkWrap: true,
        padding: const EdgeInsets.only(top: 0),
        itemBuilder: (context, index) => Row(
          children: [
            Container(
              width: screenWidth * 0.34,
              height: screenHeight * 0.1,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
              ),
              child: Shimmer(
                gradient: shimmerGradient,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            const Expanded(
              child: Padding(
                padding: EdgeInsets.only(left: 10, right: 20),
                child: Text(
                  'Loading....',
                  maxLines: 2,
                  style:
                      TextStyle(fontSize: 14, overflow: TextOverflow.ellipsis),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(right: 10),
              width: screenWidth * 0.08,
              child: Image.asset(
                searchPlay,
                fit: BoxFit.cover,
                color: Colors.white,
              ),
            )
          ],
        ),
        separatorBuilder: (context, index) => kHeight(10),
        itemCount: 20,
      ),
    );
  }
}
