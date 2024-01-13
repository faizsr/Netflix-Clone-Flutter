import 'package:netflix_clone_project/core/string.dart';
import 'package:netflix_clone_project/infrastructure/api_key.dart';

class ApiEndPoints {
  static const popularMovies = "$kBaseUrl/movie/popular?api_key=$apiKey";
  static const trendingMovies = "$kBaseUrl/trending/movie/day?api_key=$apiKey";
  static const pastYearMovies = "$kBaseUrl/discover/movie?api_key=$apiKey";
  static const upComingMovies = "$kBaseUrl/movie/upcoming?api_key=$apiKey";

  static const topRatedSeries = '$kBaseUrl/tv/top_rated?api_key=$apiKey';
  static const airingTodaySeries = '$kBaseUrl/tv/airing_today?api_key=$apiKey';
}
