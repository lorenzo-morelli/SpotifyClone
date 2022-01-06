import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:line_icons/line_icons.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:spotify/services/audio.dart';
import 'package:spotify/services/colors.dart';
import 'package:spotify/shared/constants.dart';
import 'package:spotify/shared/elements.dart';

class AlbumPage extends StatefulWidget {
  const AlbumPage({Key? key, required this.album}) : super(key: key);
  final Album album;

  @override
  _AlbumPageState createState() => _AlbumPageState();
}

class _AlbumPageState extends State<AlbumPage> {
  Color appBarColor = Constants.grey;

  @override
  void initState() {
    ColorProvider.updatePaletteGenerator(Image.network(widget.album.urlAlbum)).then((color) {
      setState(() =>  appBarColor = color);
    });
    AudioController.player.audioPlayer.onAudioPositionChanged.listen((Duration p) async {
      if (mounted) {
        setState(() => AudioController.timeProgress = p.inMilliseconds);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Elements> elementsList = Constants.allElements.where((song) => song is Song && song.album.albumName == widget.album.albumName).toList();
    List<Song> songList = List<Song>.from(elementsList);
    songList.sort((a, b) => a.number.compareTo(b.number));

    return Scaffold(
      backgroundColor: Constants.backgroundColor,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: appBarColor,
            pinned: true,
            stretch: true,
            expandedHeight: 330,
            flexibleSpace: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [appBarColor, appBarColor.darken(0.07)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                )
              ),
              child: FlexibleSpaceBar(
                centerTitle: true,
                title: Text(widget.album.albumName, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, letterSpacing: -0.5)),
                background: FittedBox(
                  fit: BoxFit.cover,
                  child: Image.network(widget.album.urlAlbum),
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10),
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 9,
                        ),
                        SizedBox(width: 8),
                        Text(widget.album.artist.artistName, style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14)),
                      ],
                    ),
                    SizedBox(height: 5),
                    Text('Album • 2000', style: TextStyle(color: Colors.white54, fontWeight: FontWeight.w300)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.favorite, color: Constants.green),
                            SizedBox(width: 20),
                            Icon(LineIcons.download, color: Colors.white70),
                            SizedBox(width: 20),
                            Icon(Feather.more_vertical, color: Colors.white70, size: 23),
                          ],
                        ),
                        IconButton(
                          padding: EdgeInsets.zero,
                          icon: Icon(MaterialIcons.play_circle_filled, color: Constants.green),
                          iconSize: 60,
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ]),
          ),
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
                                    fontSize: 16, color: Playing.playingSong == songList[index] ? Constants.green : Colors.white)),
                            SizedBox(height: 3),
                            Text(songList[index].artist.artistName, style: TextStyle(color: Colors.white70, fontSize: 13.7)),
                          ],
                        ),
                        Icon(Feather.more_vertical, color: Colors.white70),
                      ],
                    ),
                  ),
                  onTap: () => AudioController.player.changeSong(songList[index]),
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
