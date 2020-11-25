import 'package:flutter/material.dart';

class Director extends StatelessWidget {
  const Director({
    Key key,
    @required this.director,
  }) : super(key: key);

  final String director;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 3,
      child: RichText(
        overflow: TextOverflow.ellipsis,
        text: TextSpan(
          text: "Director: ",
          style: Theme.of(context)
              .textTheme
              .headline5
              .copyWith(fontWeight: FontWeight.bold),
          children: <TextSpan>[
            TextSpan(
                text: director, style: Theme.of(context).textTheme.headline5),
          ],
        ),
      ),
    );
  }
}