import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix_clone_project/application/search/search.dart';
import 'package:netflix_clone_project/core/assets.dart';
import 'package:netflix_clone_project/core/constants.dart';
import 'package:netflix_clone_project/core/utils/debouncer.dart';
import 'package:netflix_clone_project/domain/model/movies.dart';
import 'package:netflix_clone_project/domain/model/series.dart';
import 'package:netflix_clone_project/presentation/search/widgets/screen_idle.dart';
import 'package:netflix_clone_project/presentation/search/widgets/search_result.dart';

ValueNotifier<List<Movie>> searching = ValueNotifier([]);

class ScreenSearch extends StatefulWidget {
  const ScreenSearch({super.key});

  @override
  State<ScreenSearch> createState() => _ScreenSearchState();
}

class _ScreenSearchState extends State<ScreenSearch> {
  final TextEditingController searchController = TextEditingController();
  late Future<List<Movie>> popularSearches;
  late Future<List<Series>> seriesList;
  final Debouncer debouncer =
      Debouncer(delay: const Duration(milliseconds: 500));
  bool isTapped = false;

  @override
  void initState() {
    popularSearches = getAllMoviesList('');
    seriesList = getAllSeriesList('');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(right: 5, left: 5, top: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CupertinoSearchTextField(
                controller: searchController,
                backgroundColor: const Color(0xFF323232),
                prefixInsets: EdgeInsetsDirectional.zero,
                suffixInsets: const EdgeInsetsDirectional.only(end: 10),
                prefixIcon: Container(
                  margin: const EdgeInsets.only(left: 10, right: 5),
                  width: 18,
                  child: Image.asset(
                    search,
                    color: const Color(0xFF737373),
                  ),
                ),
                suffixIcon: const Icon(
                  CupertinoIcons.xmark_circle_fill,
                  color: Color(0xFF737373),
                ),
                style: const TextStyle(
                  color: Color(0xFFE6E6E6),
                  letterSpacing: 0.3,
                ),
                onTap: () {
                  setState(() {
                    isTapped = true;
                  });
                },
                onChanged: (value) {
                  debouncer.run(() {
                    setState(() {
                      popularSearches = getAllMoviesList(value);
                      seriesList = getAllSeriesList(value);
                    });
                  });
                },
              ),
              kHeight(size.height * 0.01),
              isTapped
                  ? Expanded(
                      child: SearchResultWidget(
                        movieList: popularSearches,
                        seriesList: seriesList,
                      ),
                    )
                  :  Expanded(
                      child: SearchIdleWidget(popularSearches: popularSearches),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
