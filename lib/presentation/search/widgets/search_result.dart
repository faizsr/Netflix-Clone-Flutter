import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:netflix_clone_project/core/constants.dart';
import 'package:netflix_clone_project/core/string.dart';
import 'package:netflix_clone_project/domain/model/movies.dart';
import 'package:netflix_clone_project/domain/model/series.dart';
import 'package:netflix_clone_project/presentation/search/widgets/search_title.dart';
import 'package:shimmer/shimmer.dart';

class SearchResultWidget extends StatelessWidget {
  const SearchResultWidget({
    super.key,
    required this.movieList,
    required this.seriesList,
  });

  final Future<List<Movie>> movieList;
  final Future<List<Series>> seriesList;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SearchTextTitle(title: 'Films & TV'),
        FutureBuilder(
            future: Future.wait([movieList, seriesList]),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return const Text('Error Loading');
              } else if (snapshot.hasData) {
                int length =
                    snapshot.data![0].length + snapshot.data![1].length;
                List<dynamic> movies = snapshot.data![0];
                List<dynamic> series = snapshot.data![1];
                return Expanded(
                  child: GridView.count(
                    padding: const EdgeInsets.only(top: 0, bottom: 10),
                    shrinkWrap: true,
                    crossAxisCount: 3,
                    mainAxisSpacing: 8,
                    crossAxisSpacing: 8,
                    childAspectRatio: 1 / 1.4,
                    children: List.generate(length, (index) {
                      if (index < movies.length) {
                        return SearchMainCard(
                          image: imageBaseUrl + movies[index].posterPath,
                        );
                      } else {
                        int seriesIndex = index - movies.length;
                        return SearchMainCard(
                          image: imageBaseUrl + series[seriesIndex].posterPath,
                        );
                      }
                    }),
                  ),
                );
              } else {
                return Container();
              }
            })
      ],
    );
  }
}

class SearchMainCard extends StatelessWidget {
  const SearchMainCard({super.key, required this.image});

  final String image;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      child: CachedNetworkImage(
        imageUrl: image,
        imageBuilder: (context, imageProvider) => ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: Image(
            image: imageProvider,
            fit: BoxFit.cover,
            width: size.width,
            height: size.height,
          ),
        ),
        placeholder: (context, url) => Shimmer(
          gradient: shimmerGradient,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
