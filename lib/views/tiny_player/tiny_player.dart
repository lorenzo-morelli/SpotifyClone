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
                      height: 54,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 7, bottom: 7, left: 7, right: 10),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(4),
                            child: Image.network(
                              'https://static.wixstatic.com/media/66ca42_aef55d220d214050a3f01a72eb2ac9c2~mv2.jpeg/v1/fill/w_900,h_900,al_c,q_90/66ca42_aef55d220d214050a3f01a72eb2ac9c2~mv2.jpeg',
                            )),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Why Are Sundays So Depressing',
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text('The Strokes', style: TextStyle(color: Colors.grey[300], fontSize: 13)),
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
                  trackHeight: 0.5,
                  overlayShape: SliderComponentShape.noOverlay,
                  thumbShape: RoundSliderThumbShape(enabledThumbRadius: 0),
                ),
                child: Slider(
                  inactiveColor: Colors.transparent,
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
