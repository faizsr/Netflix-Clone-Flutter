import 'dart:async';
import 'dart:convert';

import 'package:netflix_clone_project/domain/core/api_end_points.dart';
import 'package:netflix_clone_project/domain/model/movies.dart';
import 'package:http/http.dart' as http;

String upComingMovies = ApiEndPoints.upComingMovies;

Future<List<Movie>> getAllUpcomingMovies() async {
  final response = await http.get(Uri.parse(upComingMovies));
  if (response.statusCode == 200) {
    final bodyAsJson = jsonDecode(response.body) as Map<String, dynamic>;
    final data = MovieList.fromJson(bodyAsJson['results']);
    return data.movieList;
  } else {
    throw Exception('Server Failure Please Try Again!!!');
  }
}
