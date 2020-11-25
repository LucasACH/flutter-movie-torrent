import 'dart:convert';
import 'package:http/http.dart' as http;
import 'TMDB_APIRequestModel.dart';

class GetPopularMovies {
  // ignore: non_constant_identifier_names
  Future<GetPopularMoviesModel> getPopularMovies(int page) async {
    var client = http.Client();
    var movieRequest;

    try {
      var response = await client.get(
          "https://api.themoviedb.org/3/movie/popular?api_key=ac2fbae093f0f234fd1e76ffe76cd7ef&language=en-US&page=$page");
      if (response.statusCode == 200) {
        var jsonString = response.body;
        var jsonMap = json.decode(jsonString);

        movieRequest = GetPopularMoviesModel.fromJson(jsonMap);
      }
    } catch (Exception) {
      return movieRequest;
    }
    
    return movieRequest;
  }
}

class GetMovieDetails {
  Future<GetMovieDetailsModel> getMoviesDetails(String id) async {
    var client = http.Client();
    var movieDatabase;

    try {
      var response = await client.get(
          "https://api.themoviedb.org/3/movie/$id?api_key=ac2fbae093f0f234fd1e76ffe76cd7ef&language=en-US&append_to_response=videos");
      if (response.statusCode == 200) {
        var jsonString = response.body;
        var jsonMap = json.decode(jsonString);

        movieDatabase = GetMovieDetailsModel.fromJson(jsonMap);
      }
    } catch (Exception) {
      return movieDatabase;
    }

    return movieDatabase;
  }
}
