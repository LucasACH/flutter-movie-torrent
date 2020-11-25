import 'package:flutter/material.dart';

class MovieGenre extends StatelessWidget {
  const MovieGenre({
    Key key,
    @required this.genre,
  }) : super(key: key);

  final String genre;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 3,
      child: RichText(
        overflow: TextOverflow.ellipsis,
        text: TextSpan(
          text: "Genre: ",
          style: Theme.of(context)
              .textTheme
              .headline5
              .copyWith(fontWeight: FontWeight.bold),
          children: <TextSpan>[
            TextSpan(text: genre, style: Theme.of(context).textTheme.headline5),
          ],
        ),
      ),
    );
  }
}