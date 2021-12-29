import 'package:audioplayers/audioplayers.dart';

class AudioController {
  AudioPlayer audioPlayer = AudioPlayer();
  PlayerState audioPlayerState = PlayerState.PAUSED;
  late AudioCache audioCache;
  String filePath = 'music/music.mp3';
  static int timeProgress = 0;
  int audioDuration = 0;

  void init() async {
    audioPlayer = AudioPlayer();
    audioCache = AudioCache(fixedPlayer: audioPlayer);
  }

  void dispose() {
    audioPlayer.release();
    audioPlayer.dispose();
    audioCache.clearAll();
  }

  void playMusic() async {
    await audioCache.play(filePath);
  }

  void pauseMusic() async {
    await audioPlayer.pause();
  }

  void seekToSec(int sec) {
    Duration newPos = Duration(seconds: sec);
    audioPlayer.seek(newPos);
  }

  String getTimeString(int? milliseconds) {
    milliseconds ??= 0;
    String minutes = '${(milliseconds / 60000).floor() < 10 ? 0 : ''}${(milliseconds / 60000).floor()}';
    String seconds = '${(milliseconds / 1000).floor() % 60 < 10 ? 0 : ''}${(milliseconds / 1000).floor() % 60}';
    return '$minutes:$seconds'; // Returns a string with the format mm:ss
  }

}
