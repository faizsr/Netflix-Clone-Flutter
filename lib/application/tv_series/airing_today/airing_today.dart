import 'dart:async';
import 'dart:convert';

import 'package:netflix_clone_project/domain/core/api_end_points.dart';
import 'package:http/http.dart' as http;
import 'package:netflix_clone_project/domain/model/series.dart';

String airingTodaySeries = ApiEndPoints.airingTodaySeries;

Future<List<Series>> getAllSeriesAiringToday() async {
  final response = await http.get(Uri.parse(airingTodaySeries));
  if (response.statusCode == 200) {
    final bodyAsJson = jsonDecode(response.body) as Map<String, dynamic>;
    final data = SeriesList.fromJson(bodyAsJson['results']);
    return data.seriesList;
  } else {
    throw Exception('Server Failure Please Try Again!!!');
  }
}
