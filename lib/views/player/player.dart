import 'dart:collection';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:line_icons/line_icons.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:spotify/services/audio.dart';
import 'package:spotify/services/colors.dart';
import 'package:spotify/services/navigation.dart';
import 'package:spotify/shared/constants.dart';
import 'package:spotify/views/player/queue.dart';

class Player extends StatefulWidget {
  const Player({Key? key, required this.audioDuration, required this.backgroundColor}) : super(key: key);
  final int audioDuration;
  final Color backgroundColor;

  @override
  _PlayerState createState() => _PlayerState();
}

class _PlayerState extends State<Player> {
  late int currentIndex;
  late int previousIndex;
  late int nextIndex;

  @override
  void initState() {
    AudioController.player.audioPlayer.onAudioPositionChanged.listen((Duration p) async {
      if (mounted) {
        setState(() => AudioController.timeProgress = p.inMilliseconds);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Container(
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.zero,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: const [Color(0xff171716), Color(0xff54544f)],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.only(left: 25, right: 25, top: 15),
            child: ListView(
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
                    Icon(Feather.more_vertical, color: Colors.white)
                  ],
                ),
                SizedBox(height: 45),
                Image.network(Playing.playingSong?.album.urlAlbum ?? ''),
                SizedBox(height: 45),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          child: Text(Playing.playingSong?.songName ?? "", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                          onTap: () {
                            Navigator.of(context).pop();
                            Navigation.navigatorKey.currentState!.pushNamed('/album');
                          },
                        ),
                        Text(Playing.playingSong?.artist.artistName ?? '', style: TextStyle(fontSize: 15, color: Colors.grey[400])),
                      ],
                    ),
                    Icon(Icons.favorite, color: Colors.green),
                  ],
                ),
                SizedBox(height: 20),
                SliderTheme(
                  data: SliderThemeData(
                    thumbShape: RoundSliderThumbShape(enabledThumbRadius: 5),
                    trackHeight: 1.8,
                    overlayShape: SliderComponentShape.noOverlay,
                  ),
                  child: Slider(
                    activeColor: Colors.white,
                    inactiveColor: Colors.white24,
                    min: 0.0,
                    max: (widget.audioDuration / 1000).floorToDouble(),
                    value: (AudioController.timeProgress / 1000).floorToDouble(),
                    onChanged: (val) {
                      AudioController.player.seekToSec(val.toInt());
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 6),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(AudioController.player.getTimeString(AudioController.timeProgress) ?? '--:--',
                          style: TextStyle(color: Colors.grey[400])),
                      Text(AudioController.player.getTimeString(widget.audioDuration) ?? '--:--',
                          style: TextStyle(color: Colors.grey[400])),
                    ],
                  ),
                ),
                SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(SimpleLineIcons.shuffle, color: Colors.white, size: 25),
                    Row(
                      children: [
                        IconButton(
                          icon: Icon(Ionicons.ios_skip_backward, color: Colors.white),
                          iconSize: 35,
                          onPressed: () {
                            if (AudioController.timeProgress < 4000) {
                              currentIndex = Playing.queue.indexWhere((element) => element.songName == Playing.playingSong!.songName);
                              previousIndex = currentIndex - 1 == -1 ? currentIndex : currentIndex - 1;
                              AudioController.player.changeSong(Playing.queue.elementAt(previousIndex));
                            } else {
                              AudioController.player.seekToSec(0);
                              print(AudioController.timeProgress);
                            }
                          },
                        ),
                        SizedBox(width: 16),
                        IconButton(
                          onPressed: () {
                            AudioController.player.audioPlayerState == PlayerState.PLAYING
                                ? AudioController.player.pauseMusic()
                                : AudioController.player.playMusic();
                            setState(() {});
                          },
                          padding: EdgeInsets.zero,
                          iconSize: 90,
                          icon: AudioController.player.audioPlayerState == PlayerState.PLAYING
                              ? Icon(MaterialIcons.pause_circle_filled, color: Colors.white, size: 90)
                              : Icon(MaterialIcons.play_circle_filled, color: Colors.white, size: 90),
                        ),
                        SizedBox(width: 16),
                        IconButton(
                          icon: Icon(Ionicons.ios_skip_forward, color: Colors.white),
                          iconSize: 35,
                          onPressed: () {
                            currentIndex = Playing.queue.indexWhere((element) => element.songName == Playing.playingSong!.songName);
                            nextIndex = currentIndex + 1 == Playing.queue.length ? currentIndex : currentIndex + 1;
                            AudioController.player.changeSong(Playing.queue.elementAt(nextIndex));
                          },
                        ),
                      ],
                    ),
                    Icon(Ionicons.ios_repeat, color: Colors.white, size: 32),
                  ],
                ),
                SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: const [
                        Icon(Icons.speaker_group, color: Colors.green),
                        SizedBox(width: 5),
                        Text("LORENZO'S ECHO DOT", style: TextStyle(color: Colors.green, fontSize: 11, letterSpacing: 2)),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(EvilIcons.share_google, color: Colors.white, size: 28),
                        SizedBox(width: 25),
                        IconButton(
                          icon: Icon(Icons.queue_music),
                          color: Colors.white,
                          onPressed: () => showModalBottomSheet(
                            context: context,
                            isScrollControlled: true,
                            builder: (context) => QueueList(),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 25),
                  child: Container(
                    padding: EdgeInsets.all(20),
                    height: 400,
                    decoration: BoxDecoration(
                      color: widget.backgroundColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Lyrics', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                            Container(
                              padding: EdgeInsets.all(4),
                              decoration: BoxDecoration(color: Colors.black26, borderRadius: BorderRadius.circular(20)),
                              child: Icon(Icons.expand_less, color: Colors.white),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          child: Text(
                            "Oh no, what's this?\nA spider web and I'm caught in the middle\nSo I turned to run\nThe thought of all the stupid things I've done",
                            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
