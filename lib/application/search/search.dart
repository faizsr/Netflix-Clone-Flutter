import 'dart:async';
import 'dart:convert';

import 'package:netflix_clone_project/domain/core/api_end_points.dart';
import 'package:netflix_clone_project/domain/model/movies.dart';
import 'package:netflix_clone_project/domain/model/series.dart';
import 'package:http/http.dart' as http;

String moviesList = ApiEndPoints.pastYearMovies;

Future<List<Movie>> getAllMoviesList(String value) async {
  final response = await http.get(Uri.parse(moviesList));
  final bodyAsJson = jsonDecode(response.body) as Map<String, dynamic>;
  final data = MovieList.fromJson(bodyAsJson['results']);
  return value == ''
      ? data.movieList
      : data.movieList
          .where(
              (element) => element.title.toLowerCase().contains(value.toLowerCase()))
          .toList();
}

String allSeries = ApiEndPoints.popularSeries;

Future<List<Series>> getAllSeriesList(String value) async {
  final response = await http.get(Uri.parse(allSeries));
  final bodyAsJson = jsonDecode(response.body) as Map<String, dynamic>;
  final data = SeriesList.fromJson(bodyAsJson['results']);
  return value == ''
      ? data.seriesList
      : data.seriesList
          .where(
              (element) => element.title.toLowerCase().contains(value.toLowerCase()))
          .toList();
}
