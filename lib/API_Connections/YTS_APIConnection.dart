import 'dart:convert';
import 'package:http/http.dart' as http;
import 'YTS_APIRequestModel.dart';


class GetTorrent {
  // ignore: non_constant_identifier_names
  Future<GetTorrentModel> getTorrent(String movie_title, String sort_by, String order_by) async {
    var client = http.Client();
    var movieRequest;
    

    try {
      var response = await client.get(
          "https://yts.mx/api/v2/list_movies.json?query_term=$movie_title&sort_by=$sort_by&order_by=$order_by&limit=50");
      if (response.statusCode == 200) {
        var jsonString = response.body;
        var jsonMap = json.decode(jsonString);

        movieRequest = GetTorrentModel.fromJson(jsonMap);
      }
    } catch (Exception) {
      return movieRequest;
    }

    return movieRequest;
  }
}