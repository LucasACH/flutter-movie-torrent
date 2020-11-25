import 'package:flutter/material.dart';

class Plot extends StatelessWidget {
  const Plot({
    Key key,
    @required this.plot,
  }) : super(key: key);

  final String plot;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 3,
      child: Text(
        plot,
        maxLines: 7,
        overflow: TextOverflow.ellipsis,
        style: Theme.of(context).textTheme.headline5,
      ),
    );
  }
}
