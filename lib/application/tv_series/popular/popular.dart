import 'dart:async';
import 'dart:convert';

import 'package:netflix_clone_project/domain/core/api_end_points.dart';
import 'package:http/http.dart' as http;
import 'package:netflix_clone_project/domain/model/series.dart';

String popularSeries = ApiEndPoints.popularSeries;

Future<List<Series>> getAllPopularSeries() async {
  final response = await http.get(Uri.parse(popularSeries));
  final bodyAsJson = jsonDecode(response.body) as Map<String, dynamic>;
  final data = SeriesList.fromJson(bodyAsJson['results']);
  return data.seriesList;
}
