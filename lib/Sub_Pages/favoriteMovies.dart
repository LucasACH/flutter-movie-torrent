import 'package:MovieTorrent/Pages/detailsPagePopular.dart';
import 'package:MovieTorrent/SharedPreferences/favoriteMovies_ListModel.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavoriteMovies extends StatefulWidget {
  @override
  _FavoriteMoviesState createState() => _FavoriteMoviesState();
}

class _FavoriteMoviesState extends State<FavoriteMovies> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: SharedPreferences.getInstance()
            .then((value) => value.getStringList("favoriteMovies")),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data.length > 0) {
              return GridView.builder(
                padding: EdgeInsets.all(20),
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    childAspectRatio: 0.55,
                    maxCrossAxisExtent: 150,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20),
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  List<FavoriteMovie> favoriteMovie =
                      FavoriteMovie.decodeMovies(snapshot.data[index]);
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailPagePopular(
                            backDropPath: favoriteMovie[0].backDropPath,
                            id: favoriteMovie[0].id,
                            title: favoriteMovie[0].title,
                            year: favoriteMovie[0].year,
                          ),
                        ),
                      );
                    },
                    child: Container(
                        child: Column(
                      children: [
                        // Small Poster
                        Expanded(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network(
                              "http://image.tmdb.org/t/p/w185/${favoriteMovie[0].posterPath}",
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return Image.asset(
                                  "assets/placeholders/placeholder_small.jpg",
                                  fit: BoxFit.cover,
                                );
                              },
                            ),
                          ),
                        ),

                        SizedBox(
                          height: 3,
                        ),

                        // Title
                        Row(
                          children: [
                            Flexible(
                              child: Container(
                                child: Text(
                                  favoriteMovie[0].title,
                                  overflow: TextOverflow.ellipsis,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline5
                                      .copyWith(
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                              ),
                            ),
                          ],
                        ),

                        // Year
                        Row(
                          children: [
                            Text(
                              favoriteMovie[0].year,
                              style: Theme.of(context).textTheme.headline3,
                            ),
                          ],
                        ),
                      ],
                    )),
                  );
                },
              );
            } else {
              return Center(
                child: Text(
                  "No Favorites",
                  style: Theme.of(context)
                      .textTheme
                      .headline6
                      .copyWith(fontWeight: FontWeight.normal),
                ),
              );
            }
          } else if (snapshot.hasData == false) {
            return Center(
              child: Text(
                "No Favorites",
                style: Theme.of(context)
                    .textTheme
                    .headline6
                    .copyWith(fontWeight: FontWeight.normal),
              ),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}
