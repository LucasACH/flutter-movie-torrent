import 'package:MovieTorrent/Sub_Pages/favoriteMovies.dart';
import 'package:MovieTorrent/Sub_Pages/popularMovies.dart';
import 'package:MovieTorrent/Sub_Pages/searchResult.dart';
import 'package:flutter/material.dart';
import 'package:MovieTorrent/API_Connections/TMDB_APIConnection.dart';
import 'package:MovieTorrent/API_Connections/TMDB_APIRequestModel.dart';
import 'package:MovieTorrent/API_Connections/YTS_APIConnection.dart';
import 'package:MovieTorrent/API_Connections/YTS_APIRequestModel.dart';
import 'package:MovieTorrent/restartWidget.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController _searchController = TextEditingController();
  Future<GetPopularMoviesModel> _popularMovies;
  Future<GetTorrentModel> _searchMovie;

  bool searchingMovie = false;
  bool favoriteMovies = false;

  @override
  void initState() {
    _popularMovies = GetPopularMovies().getPopularMovies(1);
    super.initState();
  }

  void searchMovie(String movieTitle, String sortBy, String orderBy) {
    _searchMovie = GetTorrent().getTorrent(movieTitle, sortBy, orderBy);
    setState(() {
      searchingMovie = true;
      movie.clear();
      _popularMovies = GetPopularMovies().getPopularMovies(1);
    });
  }

  bool favoritesColor = false;
  bool settingsColor = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(new FocusNode()),
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(50),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        if (favoriteMovies) {
                          setState(() {
                            favoriteMovies = false;
                            searchingMovie = false;
                          });
                        } else {
                          setState(() {
                            favoriteMovies = true;
                            searchingMovie = false;
                            _searchController.clear();
                          });
                        }
                      },
                      child: MouseRegion(
                        onHover: (event) {
                          setState(() {
                            favoritesColor = true;
                          });
                        },
                        onExit: (event) {
                          setState(() {
                            favoritesColor = false;
                          });
                        },
                        child: Row(
                          children: [
                            IconButton(
                              icon: Icon(
                                  favoriteMovies ? Icons.movie : Icons.favorite,
                                  color: favoritesColor
                                      ? Colors.white
                                      : Colors.grey),
                              onPressed: () {
                                if (favoriteMovies) {
                                  setState(() {
                                    favoriteMovies = false;
                                    searchingMovie = false;
                                  });
                                } else {
                                  setState(() {
                                    favoriteMovies = true;
                                    searchingMovie = false;
                                    _searchController.clear();
                                  });
                                }
                              },
                            ),
                            Text(
                              favoriteMovies ? "Popular" : "Favorites",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6
                                  .copyWith(
                                      color: favoritesColor
                                          ? Colors.white
                                          : Colors.grey),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 300),
                        child: TextField(
                          controller: _searchController,
                          autocorrect: false,
                          enableSuggestions: false,
                          keyboardType: TextInputType.emailAddress,
                          cursorColor: Theme.of(context).accentColor,
                          obscureText: false,
                          style: Theme.of(context).textTheme.headline5,
                          decoration: InputDecoration(
                              suffixIcon: searchingMovie
                                  ? IconButton(
                                      icon: Icon(Icons.cancel),
                                      onPressed: () {
                                        setState(() {
                                          searchingMovie = false;
                                          _searchController.clear();
                                        });
                                      },
                                      color: Colors.grey,
                                    )
                                  : null,
                              prefixIcon: Icon(
                                Icons.search,
                                color: Colors.grey,
                                size: 20,
                              ),
                              hintText: "Search Movie",
                              ),
                          onSubmitted: (value) {
                            setState(
                              () {
                                searchMovie(value, "year", "desc");
                              },
                            );
                          },
                        ),
                      ),
                    ),
                    MouseRegion(
                      onHover: (event) {
                        setState(() {
                          settingsColor = true;
                        });
                      },
                      onExit: (event) {
                        setState(() {
                          settingsColor = false;
                        });
                      },
                      child: IconButton(
                          icon: Icon(Icons.refresh,
                              color:
                                  settingsColor ? Colors.white : Colors.grey),
                          onPressed: () => RestartWidget.restartApp(context)),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Expanded(
                child: Builder(
                  builder: (context) {
                    if (searchingMovie) {
                      return SearchResult(searchResult: _searchMovie);
                    } else if (favoriteMovies && searchingMovie == false) {
                      return FavoriteMovies();
                    } else {
                      return FutureBuilder<GetPopularMoviesModel>(
                        future: _popularMovies,
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return PopularMovies(
                              popularMovies: snapshot.data,
                            );
                          } else {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                        },
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}