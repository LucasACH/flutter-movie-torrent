import 'dart:convert';

import 'package:http/http.dart' as http;
import 'OMDB_APIRequestModel.dart';

// ignore: camel_case_types
class GetExtraDetails {
  Future<GetExtraDetailsModel> getExtraDetails(String title, String year) async {
    var client = http.Client();
    var movieDatabase;

    try {
      var response = await client.get(
          "http://omdbapi.com/?apikey=140e572d&t=$title&y=$year&plot=full");
      if (response.statusCode == 200) {
        var jsonString = response.body;
        var jsonMap = json.decode(jsonString);

        movieDatabase = GetExtraDetailsModel.fromJson(jsonMap);
      }
    } catch (Exception) {
      return movieDatabase;
    }

    return movieDatabase;
  }
}
