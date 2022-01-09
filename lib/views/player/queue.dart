import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:spotify/services/audio.dart';
import 'package:spotify/shared/constants.dart';

class QueueList extends StatefulWidget {
  const QueueList({Key? key}) : super(key: key);

  @override
  _QueueListState createState() => _QueueListState();
}

class _QueueListState extends State<QueueList> {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Container(
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.zero,
          color: Constants.backgroundColor,
          child: Padding(
            padding: EdgeInsets.only(left: 25, right: 25, top: 15),
            child: ListView(
              shrinkWrap: true,
              children: [
                SizedBox(height: 45),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      child: Icon(Entypo.chevron_thin_down, color: Colors.white, size: 25),
                      onTap: () => Navigator.pop(context),
                    ),
                    Column(
                      children: [
                        Text('PLAYING FROM ALBUM', style: TextStyle(fontSize: 12, letterSpacing: 1)),
                        Text(Playing.playingSong?.album.albumName ?? '', style: TextStyle(fontWeight: FontWeight.w500)),
                      ],
                    ),
                    Container(width: 20),
                  ],
                ),
                SizedBox(height: 30),
                Text('Playing', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16)),
                Padding(
                  padding: EdgeInsets.only(top: 20, bottom: 35),
                  child: Row(
                    children: [
                      SizedBox(
                        height: 45,
                        child: Image.network(Playing.playingSong!.album.urlAlbum),
                      ),
                      SizedBox(width: 16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(Playing.playingSong!.songName, style: TextStyle(fontSize: 16)),
                          Text(Playing.playingSong!.artist.artistName, style: TextStyle(fontSize: 14, color: Colors.white60)),
                        ],
                      ),
                    ],
                  ),
                ),
                Text('Next from: ${Playing.playingSong!.album.albumName}', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16)),
                SizedBox(height: 25),
                ListView.builder(
                  physics: ClampingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: Playing.queue.length,
                  itemBuilder: ((context, index) => InkWell(
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Icon(Icons.circle_outlined, color: Colors.white30),
                                  SizedBox(width: 20),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(Playing.queue[index].songName,
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Playing.playingSong == Playing.queue[index] ? Constants.green : Colors.white)),
                                      Text(Playing.queue[index].artist.artistName, style: TextStyle(fontSize: 14, color: Colors.white60))
                                    ],
                                  ),
                                ],
                              ),
                              Icon(Icons.menu, color: Colors.white70)
                            ],
                          ),
                        ),
                        onTap: () {
                          AudioController.player.changeSong(Playing.queue[index]);
                          setState(() {});
                        },
                      )),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
