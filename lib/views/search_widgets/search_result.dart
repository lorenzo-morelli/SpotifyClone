import 'package:flutter/material.dart';
import 'package:spotify/services/audio.dart';
import 'package:spotify/services/navigation.dart';
import 'package:spotify/shared/elements.dart';

class SearchResult extends StatefulWidget {
  const SearchResult({Key? key, required this.result}) : super(key: key);
  final Elements result;
  @override
  _SearchResultState createState() => _SearchResultState();
}

class _SearchResultState extends State<SearchResult> {
  dynamic el;

  @override
  void initState() {
    el = widget.result;
    AudioController.player.audioPlayer.onAudioPositionChanged.listen((Duration p) async {
      if (mounted) {
        setState(() => AudioController.timeProgress = p.inMilliseconds);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (el is Artist) {
      return InkWell(
        child: ListTile(
          contentPadding: EdgeInsets.all(0),
          leading: CircleAvatar(
            radius: 22,
            backgroundColor: Colors.red,
          ),
          title: Text(el.artistName, style: TextStyle(color: Colors.white)),
          subtitle: Text('Artist', style: TextStyle(color: Color(0xffcccccc))),
          trailing: Icon(Icons.close, color: Colors.white, size: 30),
        ),
      );
    }
    if (el is Song) {
      return InkWell(
        child: ListTile(
          //tileColor: Colors.blue,
          contentPadding: EdgeInsets.all(0),
          leading: SizedBox.square(
            dimension: 50,
            child: Image.network(el.album.urlAlbum),
          ),
          title: Text(el.songName, style: TextStyle(color: Colors.white)),
          subtitle: Text('Song', style: TextStyle(color: Color(0xffcccccc))),
          trailing: Icon(Icons.close, color: Colors.white, size: 30),
        ),
        onTap: () => AudioController.player.changeSong(el),
      );
    }
    if (el is Album) {
      return InkWell(
        child: ListTile(
          contentPadding: EdgeInsets.all(0),
          leading: CircleAvatar(
            radius: 22,
            backgroundColor: Colors.red,
          ),
          title: Text(el.albumName, style: TextStyle(color: Colors.white)),
          subtitle: Text('Album', style: TextStyle(color: Color(0xffcccccc))),
          trailing: Icon(Icons.close, color: Colors.white, size: 30),
        ),
        onTap: () {
          Playing.currentAlbum = el.album;
          Navigation.navigatorKey.currentState!.pushNamed('/album');
        },
      );
    }
    throw Exception();
  }
}
