import 'dart:convert';

class FavoriteMovie {
  final String title;
  final String year;
  final String posterPath;
  final String backDropPath;
  final String id;

  FavoriteMovie({
    this.title,
    this.year,
    this.posterPath,
    this.backDropPath,
    this.id,
  });

  factory FavoriteMovie.fromJson(Map<String, dynamic> jsonData) {
    return FavoriteMovie(
      title: jsonData["title"],
      year: jsonData["year"],
      posterPath: jsonData["posterPath"],
      backDropPath: jsonData["backDropPath"],
      id: jsonData["id"]
    );
  }

  static Map<String, dynamic> toMap(FavoriteMovie movie) => {
        "title": movie.title,
        "year": movie.year,
        "posterPath": movie.posterPath,
        "backDropPath":movie.backDropPath,
        "id":movie.id
      };

  static String encodeMovies(List<FavoriteMovie> movies) => json.encode(
        movies
            .map<Map<String, dynamic>>((movie) => FavoriteMovie.toMap(movie))
            .toList(),
      );

  static List<FavoriteMovie> decodeMovies(String movies) =>
      (json.decode(movies) as List<dynamic>)
          .map<FavoriteMovie>((item) => FavoriteMovie.fromJson(item))
          .toList();
}
