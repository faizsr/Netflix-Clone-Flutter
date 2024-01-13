import 'dart:async';
import 'dart:convert';

import 'package:netflix_clone_project/domain/core/api_end_points.dart';
import 'package:netflix_clone_project/domain/model/movies.dart';
import 'package:http/http.dart' as http;

String trendingMovie = ApiEndPoints.trendingMovies;

Future<List<Movie>> getAllTrending() async {
  final response = await http.get(Uri.parse(trendingMovie));
  final bodyAsJson = jsonDecode(response.body) as Map<String, dynamic>;
  final data = MovieList.fromJson(bodyAsJson['results']);
  return data.movieList;
}
