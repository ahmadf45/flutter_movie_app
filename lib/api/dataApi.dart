import 'dart:convert';

import 'package:flutter_movie_app/model/credit.dart';
import 'package:flutter_movie_app/model/movieDetail.dart';
import 'package:flutter_movie_app/model/movies.dart';
import 'package:flutter_movie_app/model/serieDetail.dart';
import 'package:flutter_movie_app/model/series.dart';
import 'package:http/http.dart' as http;

class DataApi {
  String key = "f94a01f0b5b52e13a60ab137ad57c74d";
  List<Movies> parsePopularMovies(String responseBody) {
    final parsed =
        jsonDecode(responseBody)['results'].cast<Map<String, dynamic>>();
    //print(parsed);
    return parsed.map<Movies>((json) => Movies.fromJson(json)).toList();
  }

  Future<List<Movies>> fetchPopularMovies() async {
    final response = await http.get(
        "https://api.themoviedb.org/3/movie/popular?api_key=$key&language=en-US&page=1");
    return parsePopularMovies(response.body);
  }

  List<Series> parsePopularSeries(String responseBody) {
    final parsed =
        jsonDecode(responseBody)['results'].cast<Map<String, dynamic>>();
    //print(parsed);
    return parsed.map<Series>((json) => Series.fromJson(json)).toList();
  }

  Future<List<Series>> fetchPopularSeries() async {
    final response = await http.get(
        "https://api.themoviedb.org/3/tv/popular?api_key=$key&language=en-US&page=1");
    return parsePopularSeries(response.body);
  }

  Future<MovieDetail> fetchDetailMovie(int id) async {
    final response = await http.get(
        'https://api.themoviedb.org/3/movie/$id?api_key=$key&language=en-US');

    return MovieDetail.fromJson(jsonDecode(response.body));
  }

  Future<SerieDetail> fetchDetailSerie(int id) async {
    final response = await http
        .get('https://api.themoviedb.org/3/tv/$id?api_key=$key&language=en-US');

    return SerieDetail.fromJson(jsonDecode(response.body));
  }

  List<Credit> parseMovieCredit(String responseBody) {
    final parsed =
        jsonDecode(responseBody)['cast'].cast<Map<String, dynamic>>();
    //print(parsed);
    return parsed.map<Credit>((json) => Credit.fromJson(json)).toList();
  }

  Future<List<Credit>> fetchMovieCredit(int id) async {
    final response = await http.get(
        "https://api.themoviedb.org/3/movie/$id/credits?api_key=$key&language=en-US");
    return parseMovieCredit(response.body);
  }

  List<Credit> parseSerieCredit(String responseBody) {
    final parsed =
        jsonDecode(responseBody)['cast'].cast<Map<String, dynamic>>();
    //print(parsed);
    return parsed.map<Credit>((json) => Credit.fromJson(json)).toList();
  }

  Future<List<Credit>> fetchSerieCredit(int id) async {
    final response = await http.get(
        "https://api.themoviedb.org/3/tv/$id/credits?api_key=$key&language=en-US");
    return parseSerieCredit(response.body);
  }
}
