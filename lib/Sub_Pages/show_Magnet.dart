import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:MovieTorrent/API_Connections/YTS_APIRequestModel.dart';

Future<void> showMagnet(List<Torrent> torrents, BuildContext context) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 400, vertical: 200),
          child: Container(
            decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                borderRadius: BorderRadius.circular(20)),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: ListView.builder(
                itemCount: torrents.length,
                itemBuilder: (context, index) {
                  return Container(
                    height: 70,
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.settings,
                                  color: Colors.white,
                                  size: 15,
                                ),
                                SizedBox(
                                  width: 3,
                                ),
                                Text(
                                  torrents[index].quality,
                                  style: Theme.of(context).textTheme.headline5,
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.file_download,
                                  color: Colors.white,
                                  size: 15,
                                ),
                                SizedBox(
                                  width: 3,
                                ),
                                Text(
                                  torrents[index].seeds.toString(),
                                  style: Theme.of(context).textTheme.headline5,
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.person_add,
                                  color: Colors.white,
                                  size: 15,
                                ),
                                SizedBox(
                                  width: 3,
                                ),
                                Text(
                                  torrents[index].peers.toString(),
                                  style: Theme.of(context).textTheme.headline5,
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.folder,
                                  color: Colors.white,
                                  size: 15,
                                ),
                                SizedBox(
                                  width: 3,
                                ),
                                Text(
                                  torrents[index].size,
                                  style: Theme.of(context).textTheme.headline5,
                                )
                              ],
                            ),
                            Container(
                              width: 50,
                              child: RaisedButton(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                onPressed: () =>
                                    FlutterClipboard.copy(torrents[index].url)
                                        .then((value) => print("copied")),
                                child: Icon(
                                  Icons.copy,
                                  size: 15,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }