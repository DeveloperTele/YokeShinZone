import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:yokeshinzone/background/constants/app_constants.dart';
import 'package:yokeshinzone/background/models/home/movie_model.dart';
import 'package:http/http.dart' as http;

class MovieRepository {

  Future<MovieModel> getPopularMovies() async {
    try {
      http.Response response = await http.get(Uri.parse('$baseUrl/movie/popular?$apiKey'));
      var data = json.decode(response.body);
      return MovieModel.fromJson(data);
    } catch (error) {
      if (kDebugMode) {
        print('/movie/popular');
        print(error);
        print(error.toString());
      }
      return MovieModel.withError("$error");
    }
  }

  Future<MovieModel> getTopRatedMovies() async {
    try {
      http.Response response = await http.get(Uri.parse('$baseUrl/movie/top_rated?$apiKey'));
      var data = json.decode(response.body);
      return MovieModel.fromJson(data);
    } catch (error) {
      if (kDebugMode) {
        print('/movie/top_rated');
        print(error);
        print(error.toString());
      }
      return MovieModel.withError("$error");
    }
  }

  Future<MovieModel> getPlayingMovies() async {
    try {
      http.Response response = await http.get(Uri.parse('$baseUrl/movie/now_playing?$apiKey'));
      var data = json.decode(response.body);
      return MovieModel.fromJson(data);
    } catch (error) {
      if (kDebugMode) {
        print('/movie/now_playing');
        print(error);
        print(error.toString());
      }
      return MovieModel.withError("$error");
    }
  }

  Future<MovieModel> getUpcomingMovies() async {
    try {
      http.Response response = await http.get(Uri.parse('$baseUrl/movie/upcoming?$apiKey'));
      var data = json.decode(response.body);
      return MovieModel.fromJson(data);
    } catch (error) {
      if (kDebugMode) {
        print('/movie/upcoming');
        print(error);
        print(error.toString());
      }
      return MovieModel.withError("$error");
    }
  }
}