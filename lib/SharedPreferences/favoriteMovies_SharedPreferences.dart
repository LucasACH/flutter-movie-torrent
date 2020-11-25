import 'package:shared_preferences/shared_preferences.dart';

setFavoriteMovie(List<String> movie) async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  List<String> movies = preferences.getStringList("favoriteMovies");
  if (movies == null) {
    preferences.setStringList("favoriteMovies", movie);
  } else {
    movies.addAll(movie);
    preferences.setStringList("favoriteMovies", movies);
  }
}

removeFavoriteMovie(int index) async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  List<String> movies = preferences.getStringList("favoriteMovies");
  movies.removeAt(index);
  movies.join(", ");
  preferences.setStringList("favoriteMovies", movies);
}

checkFirstTimeUser() async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  if (preferences.getStringList("favoriteMovies") == null) {
    preferences.setStringList("favoriteMovies", []);
  } else {
    print("hasData");
  }
}
