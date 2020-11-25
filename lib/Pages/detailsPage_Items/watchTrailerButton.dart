import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class WatchTrailer {
  void watchTrailer(String trailerId) async {
    String url = "https://www.youtube.com/embed/$trailerId?autoplay=1";
    if (await canLaunch(url).timeout(Duration(seconds: 3))) {
      try {
        await launch(url);
      } catch (e) {
        print(e);
      }
    } else {
      throw 'Could not launch $url';
    }
  }
}

class WatchTrailerButton extends StatelessWidget {
  const WatchTrailerButton({
    Key key,
    @required this.youtubeTrailerCode,
  }) : super(key: key);

  final String youtubeTrailerCode;

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      onPressed: () => WatchTrailer().watchTrailer(youtubeTrailerCode),
      child: Text(
        "Watch Trailer",
        style: Theme.of(context)
            .textTheme
            .headline5,
      ),
    );
  }
}