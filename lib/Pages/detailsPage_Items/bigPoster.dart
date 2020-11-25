import 'package:flutter/material.dart';

class BigPoster extends StatelessWidget {
  const BigPoster({
    Key key,
    @required this.posterPath,
  }) : super(key: key);

  final String posterPath;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.network(
          "http://image.tmdb.org/t/p/w500/$posterPath",
          fit: BoxFit.fitHeight,
          errorBuilder: (context, error, stackTrace) {
            return Image.asset("assets/placeholders/placeholder.jpg",
                fit: BoxFit.fitHeight);
          },
        ),
      ),
    );
  }
}
