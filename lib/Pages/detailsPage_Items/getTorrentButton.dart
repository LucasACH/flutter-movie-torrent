import 'package:MovieTorrent/API_Connections/YTS_APIRequestModel.dart';
import 'package:MovieTorrent/Sub_Pages/show_Magnet.dart';
import 'package:flutter/material.dart';

class GetTorrentButton extends StatelessWidget {
  const GetTorrentButton({
    Key key,
    @required this.torrents,
  }) : super(key: key);

  final List<Torrent> torrents;

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      onPressed: () => showMagnet(torrents, context),
      child: Text("Get Torrent"),
    );
  }
}