import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class GeneralInfo extends StatelessWidget {
  const GeneralInfo({
    Key key,
    @required this.releaseYear,
    @required this.runtime,
    @required this.voteAverage,
  }) : super(key: key);

  final int releaseYear;
  final int runtime;
  final double voteAverage;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "$releaseYear   |   $runtime min   |   $voteAverage",
          style: Theme.of(context).textTheme.headline3,
        ),
        SizedBox(
          width: 5,
        ),
        RatingBarIndicator(
          rating: voteAverage / 2,
          itemCount: 5,
          itemSize: 12,
          itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
          itemBuilder: (context, _) => Icon(
            Icons.star,
            color: Theme.of(context).accentColor,
          ),
        ),
      ],
    );
  }
}