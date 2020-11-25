import 'package:MovieTorrent/API_Connections/YTS_APIRequestModel.dart';
import 'package:MovieTorrent/Pages/detailsPageSearch.dart';
import 'package:flutter/material.dart';

class SearchResult extends StatelessWidget {
  const SearchResult({
    Key key,
    @required Future<GetTorrentModel> searchResult,
  })  : _searchResult = searchResult,
        super(key: key);

  final Future<GetTorrentModel> _searchResult;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<GetTorrentModel>(
      future: _searchResult,
      builder: (context, snapshot) {
        if (snapshot.hasData &&
            snapshot.connectionState == ConnectionState.done) {
          if (snapshot.data.data.movieCount > 0) {
            return GridView.builder(
              padding: EdgeInsets.all(20),
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  childAspectRatio: 0.55,
                  maxCrossAxisExtent: 150,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20),
              itemCount: snapshot.data.data.movieCount,
              itemBuilder: (context, index) {
                var movies = snapshot.data.data.movies[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailPageSearch(
                          yotubeId: movies.ytTrailerCode,
                          backDropId: movies.backgroundImage,
                          id: movies.imdbCode,
                          title: movies.title,
                          year: movies.year.toString(),
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
                            movies.mediumCoverImage,
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
                                movies.title,
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
                            movies.year.toString(),
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
            // Not Found
            return Center(
              child: Text(
                "Not Found",
                style: Theme.of(context)
                    .textTheme
                    .headline6
                    .copyWith(fontWeight: FontWeight.normal),
              ),
            );
          }
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.connectionState == ConnectionState.done) {
          return Center(
            child: Text(
              "Not Found",
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
      },
    );
  }
}