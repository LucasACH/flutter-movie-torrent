import 'package:flutter/material.dart';

class Actors extends StatelessWidget {
  const Actors({
    Key key,
    @required this.actors,
  }) : super(key: key);

  final String actors;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 3,
      child: RichText(
        overflow: TextOverflow.ellipsis,
        text: TextSpan(
          text: "Actors: ",
          style: Theme.of(context)
              .textTheme
              .headline5
              .copyWith(fontWeight: FontWeight.bold),
          children: <TextSpan>[
            TextSpan(
                text: actors, style: Theme.of(context).textTheme.headline5),
          ],
        ),
      ),
    );
  }
}