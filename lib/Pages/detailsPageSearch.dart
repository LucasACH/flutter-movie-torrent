import 'dart:async';

import 'package:MovieTorrent/Pages/detailsPage_Items/actors.dart';
import 'package:MovieTorrent/Pages/detailsPage_Items/bigPoster.dart';
import 'package:MovieTorrent/Pages/detailsPage_Items/director.dart';
import 'package:MovieTorrent/Pages/detailsPage_Items/genralInfo.dart';
import 'package:MovieTorrent/Pages/detailsPage_Items/genre.dart';
import 'package:MovieTorrent/Pages/detailsPage_Items/getTorrentButton.dart';
import 'package:MovieTorrent/Pages/detailsPage_Items/plot.dart';
import 'package:MovieTorrent/Pages/detailsPage_Items/watchTrailerButton.dart';
import 'package:flutter/material.dart';
import 'package:MovieTorrent/API_Connections/OMDB_APIConnection.dart';
import 'package:MovieTorrent/API_Connections/OMDB_APIRequestModel.dart';
import 'package:MovieTorrent/API_Connections/TMDB_APIConnection.dart';
import 'package:MovieTorrent/API_Connections/TMDB_APIRequestModel.dart';
import 'package:MovieTorrent/API_Connections/YTS_APIConnection.dart';
import 'package:MovieTorrent/API_Connections/YTS_APIRequestModel.dart';
import 'package:MovieTorrent/SharedPreferences/favoriteMovies_ListModel.dart';
import 'package:MovieTorrent/SharedPreferences/favoriteMovies_SharedPreferences.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DetailPageSearch extends StatefulWidget {
  final String id;
  final String yotubeId;
  final String backDropId;
  final String title;
  final String year;

  const DetailPageSearch(
      {Key key,
      @required this.backDropId,
      @required this.id,
      @required this.yotubeId,
      @required this.title,
      @required this.year})
      : super(key: key);

  @override
  _DetailPageSearchState createState() => _DetailPageSearchState();
}

class _DetailPageSearchState extends State<DetailPageSearch> {
  Future<GetMovieDetailsModel> _movieDetails;
  Future<GetExtraDetailsModel> _getExtraDetails;

  @override
  void initState() {
    _movieDetails = GetMovieDetails().getMoviesDetails(widget.id);
    _getExtraDetails =
        GetExtraDetails().getExtraDetails(widget.title, widget.year);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            // BackDrop Image
            image: NetworkImage(widget.backDropId),
            fit: BoxFit.cover,
            onError: (exception, stackTrace) {
              return Container();
            },
            colorFilter: ColorFilter.mode(Colors.grey[900], BlendMode.modulate),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 100),
          child: Center(
            child: FutureBuilder<GetMovieDetailsModel>(
                future: _movieDetails,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    String movieId = snapshot.data.id.toString();
                    String posterPath = snapshot.data.posterPath;
                    int releaseYear = snapshot.data.releaseDate.year;
                    int runtime = snapshot.data.runtime;
                    double voteAverage = snapshot.data.voteAverage;

                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Big Poster
                        BigPoster(posterPath: posterPath),

                        SizedBox(
                          width: 30,
                        ),

                        // Title
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  snapshot.data.title,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline6
                                      .copyWith(fontSize: 30),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                FutureBuilder(
                                  future: SharedPreferences.getInstance().then(
                                      (value) => value
                                          .getStringList("favoriteMovies")),
                                  builder: (context, snapshot) {
                                    if (snapshot.hasData) {
                                      int index;
                                      bool isFavorite = false;
                                      List<FavoriteMovie> favoriteMovie;
                                      List<String> movieIds = [];
                                      List<String> backDropPaths = [];
                                      String backDropPath;
                                      for (var i = 0;
                                          i < snapshot.data.length;
                                          i++) {
                                        favoriteMovie =
                                            FavoriteMovie.decodeMovies(
                                                snapshot.data[i]);
                                        movieIds.add(favoriteMovie[0].id);
                                        backDropPaths
                                            .add(favoriteMovie[0].backDropPath);
                                      }
                                      if (movieIds.contains(movieId)) {
                                        isFavorite = true;
                                        index = movieIds.indexOf(movieId);
                                        backDropPath = backDropPaths[index];
                                      } else {
                                        isFavorite = false;
                                      }
                                      return IconButton(
                                          icon: Icon(isFavorite
                                              ? Icons.favorite
                                              : Icons.favorite_border),
                                          iconSize: 20,
                                          color: Colors.white,
                                          onPressed: () {
                                            if (isFavorite) {
                                              removeFavoriteMovie(index);
                                              setState(() {});
                                            } else {
                                              final List<String> encodedData = [
                                                FavoriteMovie.encodeMovies(
                                                  [
                                                    FavoriteMovie(
                                                      posterPath: posterPath,
                                                      title: widget.title,
                                                      year: widget.year,
                                                      id: movieId,
                                                      backDropPath:
                                                          backDropPath,
                                                    ),
                                                  ],
                                                )
                                              ];
                                              setFavoriteMovie(encodedData);
                                              setState(() {});
                                            }
                                          });
                                    } else {
                                      return Center(
                                          child: CircularProgressIndicator());
                                    }
                                  },
                                ),
                              ],
                            ),

                            SizedBox(
                              height: 15,
                            ),

                            // General info
                            GeneralInfo(
                              releaseYear: releaseYear,
                              runtime: runtime,
                              voteAverage: voteAverage,
                            ),

                            SizedBox(
                              height: 15,
                            ),

                            // Extra Details | New API Request
                            FutureBuilder<GetExtraDetailsModel>(
                              future: _getExtraDetails,
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  String plot = snapshot.data.plot;
                                  String genre = snapshot.data.genre;
                                  String actors = snapshot.data.actors;
                                  String director = snapshot.data.director;

                                  return Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      //Plot
                                      Plot(plot: plot),

                                      SizedBox(
                                        height: 15,
                                      ),

                                      // Genre
                                      MovieGenre(genre: genre),

                                      SizedBox(
                                        height: 15,
                                      ),

                                      // Actors
                                      Actors(actors: actors),

                                      SizedBox(
                                        height: 15,
                                      ),

                                      // Director
                                      Director(director: director),
                                    ],
                                  );
                                } else {
                                  return Center(
                                    child: CircularProgressIndicator(),
                                  );
                                }
                              },
                            ),
                            Spacer(
                              flex: 1,
                            ),
                            FutureBuilder<GetTorrentModel>(
                              future: GetTorrent().getTorrent(
                                  snapshot.data.imdbId, "seeds", "desc"),
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  List<Torrent> torrents =
                                      snapshot.data.data.movies[0].torrents;
                                  String youtubeTrailerCode = snapshot
                                      .data.data.movies[0].ytTrailerCode;

                                  return Row(
                                    children: [
                                      // Get Torrent Button
                                      GetTorrentButton(torrents: torrents),

                                      SizedBox(
                                        width: 10,
                                      ),

                                      // Watch Trailer Button
                                      WatchTrailerButton(youtubeTrailerCode: youtubeTrailerCode),

                                      SizedBox(
                                        width: 70,
                                      ),
                                    ],
                                  );
                                } else if (snapshot.hasData == false &&
                                    snapshot.connectionState ==
                                        ConnectionState.done) {

                                  // If Torrent Magnet does not exists          
                                  return Row(
                                    children: [
                                      Icon(
                                        Icons.error,
                                        color: Colors.white,
                                        size: 20,
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        "This movie is unavailable",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline4
                                            .copyWith(color: Colors.white),
                                      ),
                                    ],
                                  );
                                } else {
                                  return Center(
                                    child: CircularProgressIndicator(),
                                  );
                                }
                              },
                            ),
                          ],
                        )
                      ],
                    );
                  } else {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                }),
          ),
        ),
      ),
    );
  }
}