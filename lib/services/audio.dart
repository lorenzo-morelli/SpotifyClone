import 'package:audioplayers/audioplayers.dart';
import 'package:spotify/shared/elements.dart';

class AudioController {
  AudioPlayer audioPlayer = AudioPlayer();
  PlayerState audioPlayerState = PlayerState.PAUSED;
  late AudioCache audioCache;
  int audioDuration = 0;
  static int timeProgress = 0;
  static AudioController player = AudioController();

  //AudioController(this.filePath);

  void init() async {
    audioPlayer = AudioPlayer();
    audioCache = AudioCache(fixedPlayer: audioPlayer);
  }

  void dispose() {
    // audioPlayer.release();
    // audioPlayer.dispose();
    // audioCache.clearAll();
  }

  void playMusic() async {
    await audioCache.play(Playing.playingSong!.filePath);
  }

  void pauseMusic() async {
    await audioPlayer.pause();
  }

  void changeSong(Song song) async {
    await audioCache.play(song.filePath);
    Playing.playingSong = song;
    print(Playing.playingSong?.album.albumName);
    seekToSec(0);
  }

  void seekToSec(int sec) {
    Duration newPos = Duration(seconds: sec);
    audioPlayer.seek(newPos);
  }

  String? getTimeString(int? milliseconds) {
    milliseconds ??= 0;
    String minutes = '${(milliseconds / 60000).floor() < 10 ? 0 : ''}${(milliseconds / 60000).floor()}';
    String seconds = '${(milliseconds / 1000).floor() % 60 < 10 ? 0 : ''}${(milliseconds / 1000).floor() % 60}';
    return '$minutes:$seconds'; // Returns a string with the format mm:ss
  }

}

class Playing {
  static Song? playingSong;
  static Album? currentAlbum;
  static List<Song> queue = [];
}
