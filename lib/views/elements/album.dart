import 'package:flutter/material.dart';
import 'package:spotify/services/audio.dart';
import 'package:spotify/shared/constants.dart';

class AlbumPage extends StatefulWidget {
  const AlbumPage({Key? key, required this.album}) : super(key: key);
  final Album album;

  @override
  _AlbumPageState createState() => _AlbumPageState();
}

class _AlbumPageState extends State<AlbumPage> {
  @override
  void initState() {
    Constants.player.audioPlayer.onAudioPositionChanged.listen((Duration p) async {
      if (mounted) {
        setState(() => AudioController.timeProgress = p.inMilliseconds);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Song> songList = Constants.allSongs.where((song) => song.album.albumName == widget.album.albumName).toList();
    songList.sort((a, b) => a.number.compareTo(b.number));
    return Scaffold(
      backgroundColor: Constants.backgroundColor,
      body: CustomScrollView(
        physics: PageScrollPhysics(),
        slivers: [
          SliverAppBar(
            backgroundColor: Constants.grey,
            pinned: true,
            floating: false,
            stretch: false,
            expandedHeight: 400,
            flexibleSpace: FlexibleSpaceBar(
              collapseMode: CollapseMode.parallax,
              title: Text(widget.album.albumName, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, letterSpacing: -0.5)),
              background: Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                  colors: [Color(0xff6d6d6d), Constants.backgroundColor],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                )),
                //child: Image.network(widget.album.urlAlbum),
              ),
            ),
          ),
          SliverList(
              delegate: SliverChildListDelegate([
            SizedBox(height: 10),
            Row(
              children: [
                CircleAvatar(
                  radius: 11,
                ),
                SizedBox(width: 8),
                Text(widget.album.artist.artistName, style: TextStyle(fontWeight: FontWeight.w500, fontSize: 13)),
              ],
            ),
            SizedBox(height: 8),
            Text('Album • 2000', style: TextStyle(color: Colors.white54)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.favorite, color: Constants.green),
                    SizedBox(width: 20),
                    Icon(Icons.download, color: Colors.white),
                    SizedBox(width: 20),
                    Icon(Icons.more_vert, color: Colors.white),
                  ],
                ),
                IconButton(
                  padding: EdgeInsets.zero,
                  icon: Icon(Icons.play_circle_rounded, color: Constants.green),
                  iconSize: 60,
                  onPressed: () {},
                ),
              ],
            ),
          ])),
          SliverList(
              delegate: SliverChildListDelegate(List.generate(songList.length, (index) {
            return InkWell(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(songList[index].songName,
                            style: TextStyle(
                                fontSize: 16, color: AudioController.playingSong == songList[index] ? Constants.green : Colors.white)),
                        Text(songList[index].artist.artistName, style: TextStyle(color: Colors.white70)),
                      ],
                    ),
                    Icon(Icons.more_vert, color: Colors.white),
                  ],
                ),
              ),
              onTap: () => Constants.player.changeSong(songList[index]),
            );
          }))),
          SliverList(
              delegate: SliverChildListDelegate([
            SizedBox(height: 200),
          ]))
        ],
      ),
    );
  }
}
