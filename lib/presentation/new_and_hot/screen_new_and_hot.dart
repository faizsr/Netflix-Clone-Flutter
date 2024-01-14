import 'package:flutter/material.dart';
import 'package:netflix_clone_project/application/movie/upcoming_movies.dart/upcoming_movies.dart';
import 'package:netflix_clone_project/application/tv_series/popular/popular.dart';
import 'package:netflix_clone_project/core/string.dart';
import 'package:netflix_clone_project/domain/model/movies.dart';
import 'package:netflix_clone_project/domain/model/series.dart';
import 'package:netflix_clone_project/presentation/new_and_hot/widgets/appbar.dart';
import 'package:netflix_clone_project/presentation/new_and_hot/widgets/coming_soon_card.dart';
import 'package:netflix_clone_project/presentation/new_and_hot/widgets/everyone_watching_card.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class ScreenNewAndHot extends StatefulWidget {
  const ScreenNewAndHot({super.key});

  @override
  State<ScreenNewAndHot> createState() => _ScreenNewAndHotState();
}

class _ScreenNewAndHotState extends State<ScreenNewAndHot> {
  late Future<List<Movie>> upComingMovies;
  late Future<List<Series>> popularSeries;

  @override
  void initState() {
    upComingMovies = getAllUpcomingMovies();
    popularSeries = getAllPopularSeries();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(size.height * 0.115),
            child: const NewAndHotAppBar(),
          ),
          body: TabBarView(
            children: [
              _tabViewOne(context, upComingMovies, size),
              _tavViewTwo(popularSeries),
            ],
          ),
        ),
      ),
    );
  }

  Widget _tabViewOne(
    BuildContext context,
    Future<List<Movie>> upComingMovies,
    Size size,
  ) {
    return FutureBuilder(
      future: upComingMovies,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Text('Error loading');
        } else if (snapshot.hasData) {
          return ListView.builder(
            shrinkWrap: true,
            itemCount: 10,
            itemBuilder: (context, index) {
              return ComingSoonCard(
                image: imageBaseUrl + snapshot.data![index].backdropPath,
                title: snapshot.data![index].title,
                overview: snapshot.data![index].overView,
                date: snapshot.data![index].releaseDate,
              );
            },
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
    );
  }

  Widget _tavViewTwo(Future<List<Series>> popularMovies) {
    return FutureBuilder(
      future: popularMovies,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Text('Error loading');
        } else if (snapshot.hasData) {
          return ListView.builder(
            itemCount: 10,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return EveryWatchCard(
                image: imageBaseUrl + snapshot.data![index].backdropPath,
                title: snapshot.data![index].title,
                overview: snapshot.data![index].overView,
              );
            },
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
    );
  }
}
