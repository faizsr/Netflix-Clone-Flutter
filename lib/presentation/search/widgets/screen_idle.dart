import 'package:flutter/material.dart';
import 'package:netflix_clone_project/core/assets.dart';
import 'package:netflix_clone_project/core/constants.dart';
import 'package:netflix_clone_project/presentation/search/widgets/search_title.dart';

class SearchIdleWidget extends StatelessWidget {
  const SearchIdleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SearchTextTitle(title: 'Popular Searches'),
        Expanded(
          child: ListView.separated(
            shrinkWrap: true,
            padding: const EdgeInsets.only(top: 10),
            itemBuilder: (context, index) => PopularSearchItemTile(
              imageList: searchImageList[1],
              movieName: searchMovieNameList[1],
            ),
            separatorBuilder: (context, index) => kHeight(10),
            itemCount: 30,
          ),
        )
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
    return Row(
      children: [
        Container(
          width: screenWidth * 0.32,
          height: 82,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(imageList!), fit: BoxFit.cover),
              borderRadius: BorderRadius.circular(5)),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(movieName!),
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
