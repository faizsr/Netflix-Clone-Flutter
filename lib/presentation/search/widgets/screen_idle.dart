import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:netflix_clone_project/core/assets.dart';
import 'package:netflix_clone_project/core/constants.dart';
import 'package:netflix_clone_project/core/string.dart';
import 'package:netflix_clone_project/domain/model/movies.dart';
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
                      imageList: imageBaseUrl + snapshot.data![index].backdropPath,
                      movieName: snapshot.data![index].title,
                    ),
                    separatorBuilder: (context, index) => kHeight(10),
                    itemCount: snapshot.data!.length,
                  ),
                );
              } else {
                return CircularProgressIndicator();
              }
            })
      ],
    );
  }
}

class PopularSearchItemTile extends StatelessWidget {
  const PopularSearchItemTile({
    super.key,
    this.imageList,
    this.movieName,
  });

  final String? imageList;
  final String? movieName;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final size = MediaQuery.of(context).size;
    return Row(
      children: [
        Container(
          width: screenWidth * 0.34,
          height: screenHeight * 0.1,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
          ),
          child: CachedNetworkImage(
            imageUrl: imageList!,
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
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 10, right: 20),
            child: Text(
              movieName!,
              maxLines: 2,
              style: const TextStyle(fontSize: 14, overflow: TextOverflow.ellipsis),
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
    );
  }
}
