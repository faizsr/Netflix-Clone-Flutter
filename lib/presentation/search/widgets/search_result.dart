import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:netflix_clone_project/core/assets.dart';
import 'package:netflix_clone_project/core/constants.dart';
import 'package:netflix_clone_project/presentation/search/widgets/search_title.dart';
import 'package:shimmer/shimmer.dart';

class SearchResultWidget extends StatelessWidget {
  const SearchResultWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SearchTextTitle(title: 'Films & TV'),
        Expanded(
          child: GridView.count(
            padding: const EdgeInsets.only(top: 0, bottom: 10),
            shrinkWrap: true,
            crossAxisCount: 3,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
            childAspectRatio: 1 / 1.4,
            children: List.generate(20, (index) {
              return const SearchMainCard();
            }),
          ),
        )
      ],
    );
  }
}

class SearchMainCard extends StatelessWidget {
  const SearchMainCard({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      // decoration: BoxDecoration(
      //   image: DecorationImage(
      //     image: NetworkImage(imageList[1]),
      //     fit: BoxFit.cover,
      //   ),
      //   borderRadius: BorderRadius.circular(5),
      // ),
      child: CachedNetworkImage(
        imageUrl: imageList[2],
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
