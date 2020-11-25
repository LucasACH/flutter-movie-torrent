import 'package:MovieTorrent/API_Connections/TMDB_APIConnection.dart';
import 'package:MovieTorrent/API_Connections/TMDB_APIRequestModel.dart';
import 'package:MovieTorrent/Pages/detailsPagePopular.dart';
import 'package:MovieTorrent/SharedPreferences/favoriteMovies_SharedPreferences.dart';
import 'package:flutter/material.dart';

class PopularMovies extends StatefulWidget {
  final GetPopularMoviesModel popularMovies;
  const PopularMovies({
    this.popularMovies,
    Key key,
  }) : super(key: key);

  @override
  _PopularMoviesState createState() => _PopularMoviesState();
}

List<ResultPopular> movie;
bool _loading = false;

class _PopularMoviesState extends State<PopularMovies> {
  ScrollController scrollController = new ScrollController();

  int currentPage = 1;

  bool onNotification(
    ScrollNotification notification,
  ) {
    if (notification is ScrollUpdateNotification) {
      if (scrollController.position.maxScrollExtent ==
              scrollController.position.pixels &&
          _loading == false) {
        setState(() {
          _loading = true;
        });
        print("loading");
        GetPopularMovies().getPopularMovies(currentPage + 1).then((value) {
          currentPage = value.page;
          setState(() {
            movie.addAll(value.results);
          });
          print("done");
          setState(() {
            _loading = false;
          });
        });
      }
    }
    return true;
  }

  @override
  void initState() {
    checkFirstTimeUser();
    movie = widget.popularMovies.results;
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener(
      onNotification: onNotification,
      child: GridView.builder(
        controller: scrollController,
        cacheExtent: MediaQuery.of(context).size.height * 2,
        padding: EdgeInsets.all(20),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            childAspectRatio: 0.55,
            maxCrossAxisExtent: 150,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20),
        itemCount: movie.length,
        itemBuilder: (context, index) {
          var movies = movie[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailPagePopular(
                    backDropPath: movies.backdropPath,
                    id: movies.id.toString(),
                    title: movies.title,
                    year: movies.releaseDate.year.toString(),
                  ),
                ),
              );
            },
            child: MouseRegion(
              child: Container(
                  child: Column(
                children: [
                  // Small Poster
                  Expanded(
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          "http://image.tmdb.org/t/p/w185/${movies.posterPath}",
                          fit: BoxFit.cover,
                          color: Colors.transparent,
                          colorBlendMode: BlendMode.darken,
                          errorBuilder: (context, error, stackTrace) {
                            return Image.asset(
                              "assets/placeholders/placeholder_small.jpg",
                              fit: BoxFit.cover,
                            );
                          },
                        )),
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
                            movies.title,
                            overflow: TextOverflow.ellipsis,
                            style:
                                Theme.of(context).textTheme.headline5.copyWith(
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
                        movies.releaseDate.year.toString() ?? "",
                        style: Theme.of(context).textTheme.headline3,
                      ),
                    ],
                  ),
                ],
              )),
            ),
          );
        },
      ),
    );
  }
}