import 'dart:async';
import 'dart:convert';

import 'package:netflix_clone_project/domain/core/api_end_points.dart';
import 'package:http/http.dart' as http;
import 'package:netflix_clone_project/domain/model/series.dart';

String topRatedSeries = ApiEndPoints.topRatedSeries;

Future<List<Series>> getAllTopRatedSeries() async {
  final response = await http.get(Uri.parse(topRatedSeries));
  final bodyAsJson = jsonDecode(response.body) as Map<String, dynamic>;
  final data = SeriesList.fromJson(bodyAsJson['results']);
  print(data.seriesList[1].overView);
  return data.seriesList;
}
