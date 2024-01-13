import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:netflix_clone_project/application/movie/past_year/past_year.dart';
import 'package:netflix_clone_project/application/movie/trending/trending.dart';
import 'package:netflix_clone_project/application/movie/popular/popular.dart';
import 'package:netflix_clone_project/application/movie/upcoming_movies.dart/upcoming_movies.dart';
import 'package:netflix_clone_project/application/tv_series/airing_today/airing_today.dart';
import 'package:netflix_clone_project/application/tv_series/top_rated/top_rated.dart';
import 'package:netflix_clone_project/core/constants.dart';
import 'package:netflix_clone_project/domain/model/movies.dart';
import 'package:netflix_clone_project/domain/model/series.dart';
import 'package:netflix_clone_project/presentation/home/widgets/app_bar.dart';
import 'package:netflix_clone_project/presentation/home/widgets/home_banner.dart';
import 'package:netflix_clone_project/presentation/home/widgets/number_title_card.dart';
import 'package:netflix_clone_project/presentation/widgets/main_title_card.dart';

ValueNotifier<bool> scrollNotifier = ValueNotifier(true);

class ScreenHome extends StatefulWidget {
  const ScreenHome({super.key});

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
  late Future<List<Movie>> popular;
  late Future<List<Movie>> trending;
  late Future<List<Movie>> pastYearMovies;
  late Future<List<Movie>> upComingMovies;
  late Future<List<Series>> topRatedSeries;
  late Future<List<Series>> airingTodaySeries;

  @override
  void initState() {
    popular = getAllPopular();
    trending = getAllTrending();
    topRatedSeries = getAllTopRatedSeries();
    pastYearMovies = getAllPastYearMovies();
    upComingMovies = getAllUpcomingMovies();
    airingTodaySeries = getAllSeriesAiringToday();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: ValueListenableBuilder(
            valueListenable: scrollNotifier,
            builder: (context, index, _) {
              return NotificationListener<UserScrollNotification>(
                onNotification: (notification) {
                  final ScrollDirection direction = notification.direction;
                  if (direction == ScrollDirection.reverse) {
                    scrollNotifier.value = false;
                  } else if (direction == ScrollDirection.forward) {
                    scrollNotifier.value = true;
                  }
                  return true;
                },
                child: Stack(
                  children: [
                    ListView(
                      children: [
                        const HomeBanner(),
                        MainTitleCard(
                          size: size,
                          title: 'Released in the past year',
                          movies: pastYearMovies,
                          reversed: true,
                        ),
                        MainTitleCard(
                          size: size,
                          title: 'Trending Now',
                          movies: trending,
                        ),
                        NumberTitleCard(
                          size: size,
                          series: topRatedSeries,
                        ),
                        MainTitleCard(
                          size: size,
                          title: 'Popular Movies',
                          movies: popular,
                        ),
                        MainTitleCard(
                          size: size,
                          title: 'TV Series Airing Today',
                          movies: airingTodaySeries,
                        ),
                        MainTitleCard(
                          size: size,
                          title: 'Upcoming Movies',
                          movies: upComingMovies,
                        ),
                      ],
                    ),
                    scrollNotifier.value
                        ? HomeScreenAppbar(size: size)
                        : kHeight(0)
                  ],
                ),
              );
            }),
      ),
    );
  }
}
