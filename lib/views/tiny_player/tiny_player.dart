import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:spotify/services/audio.dart';
import 'package:spotify/views/player/player.dart';

class TinyPlayer extends StatefulWidget {
  const TinyPlayer({Key? key, required this.player, required this.audioDuration}) : super(key: key);
  final AudioController player;
  final int audioDuration;

  @override
  _TinyPlayerState createState() => _TinyPlayerState();
}

class _TinyPlayerState extends State<TinyPlayer> {
  @override
  void initState() {
    widget.player.audioPlayer.onPlayerStateChanged.listen((PlayerState s) {
      setState(() {
        widget.player.audioPlayerState = s;
      });
    });
    widget.player.audioPlayer.onAudioPositionChanged.listen((Duration p) async {
      setState(() {
        AudioController.timeProgress = p.inMilliseconds;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.symmetric(horizontal: 7),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: Colors.grey[700],
        ),
        height: 55,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SizedBox(
                      height: 53,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 7, bottom: 7, left: 7, right: 10),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(4),
                          child: AudioController.playingSong?.album.urlAlbum != null
                              ? Image.network(AudioController.playingSong?.album.urlAlbum ?? '')
                              : Container(),
                        ),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AudioController.playingSong?.songName ?? '',
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(AudioController.playingSong?.artist.artistName ?? '', style: TextStyle(color: Colors.grey[300], fontSize: 13)),
                      ],
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(Icons.favorite, color: Colors.green, size: 26),
                    IconButton(
                      onPressed: () {
                        widget.player.audioPlayerState == PlayerState.PLAYING ? widget.player.pauseMusic() : widget.player.playMusic();
                        setState(() {});
                      },
                      iconSize: 35,
                      icon: widget.player.audioPlayerState == PlayerState.PLAYING
                          ? Icon(Icons.pause, color: Colors.white)
                          : Icon(Icons.play_arrow, color: Colors.white),
                    ),
                    SizedBox(width: 5),
                  ],
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: SliderTheme(
                data: SliderThemeData(
                  trackHeight: 2,
                  trackShape: RectangularSliderTrackShape(),
                  overlayShape: SliderComponentShape.noOverlay,
                  thumbShape: RoundSliderThumbShape(enabledThumbRadius: 0),
                ),
                child: Slider(
                  inactiveColor: Colors.white24,
                  activeColor: Colors.white,
                  min: 0.0,
                  max: (widget.audioDuration / 1000).floorToDouble(),
                  value: (AudioController.timeProgress / 1000).floorToDouble(),
                  onChanged: (val) {
                    widget.player.seekToSec(val.toInt());
                  },
                ),
              ),
            ),
          ],
        ),
      ),
      onTap: () => showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (context) => Player(player: widget.player, audioDuration: widget.audioDuration),
      ),
    );
  }
}
