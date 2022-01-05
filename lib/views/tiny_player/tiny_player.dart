import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:spotify/services/audio.dart';
import 'package:spotify/services/colors.dart';
import 'package:spotify/views/player/player.dart';

class TinyPlayer extends StatefulWidget {
  const TinyPlayer({Key? key, required this.audioDuration}) : super(key: key);
  final int audioDuration;

  @override
  _TinyPlayerState createState() => _TinyPlayerState();
}

class _TinyPlayerState extends State<TinyPlayer> {
  Color? backgroundColor;

  @override
  void initState() {
    ColorProvider.updatePaletteGenerator(Image.network(Playing.currentAlbum!.urlAlbum)).then((color) {
      setState(() => backgroundColor = color);
    });
    AudioController.player.audioPlayer.onPlayerStateChanged.listen((PlayerState s) {
      setState(() {
        AudioController.player.audioPlayerState = s;
      });
    });
    AudioController.player.audioPlayer.onAudioPositionChanged.listen((Duration p) async {
      setState(() {
        AudioController.timeProgress = p.inMilliseconds;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return backgroundColor != null ? InkWell(
      child: Container(
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.symmetric(horizontal: 7),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: backgroundColor,
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
                          child: Playing.playingSong?.album.urlAlbum != null
                              ? Image.network(Playing.playingSong?.album.urlAlbum ?? '')
                              : Container(),
                        ),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          Playing.playingSong?.songName ?? '',
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(Playing.playingSong?.artist.artistName ?? '', style: TextStyle(color: Colors.grey[300], fontSize: 13)),
                      ],
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(EvilIcons.heart, color: Colors.white, size: 32),
                    IconButton(
                      onPressed: () {
                        AudioController.player.audioPlayerState == PlayerState.PLAYING
                            ? AudioController.player.pauseMusic()
                            : AudioController.player.playMusic();
                        setState(() {});
                      },
                      iconSize: 35,
                      icon: AudioController.player.audioPlayerState == PlayerState.PLAYING
                          ? Icon(Icons.pause, color: Colors.white)
                          : Icon(Entypo.controller_play, color: Colors.white, size: 32),
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
                    AudioController.player.seekToSec(val.toInt());
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
        builder: (context) => Player(audioDuration: widget.audioDuration, backgroundColor: backgroundColor!),
      ),
    ) : Container();
  }
}
