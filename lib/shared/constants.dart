import 'package:flutter/material.dart';
import 'package:spotify/views/home_widgets/usual_item.dart';
import 'package:spotify/views/search_widgets/genres_item.dart';

class Constants {
  static ThemeData theme = ThemeData(
    fontFamily: 'Circular',
    textTheme: TextTheme(
      bodyText2: TextStyle(color: Colors.white),
    ),
    primarySwatch: Colors.green,
  );

  static List<UsualItem> usuals = [
    UsualItem(icon: Icons.music_note, name: 'An Evening With Silk Sonic'),
    UsualItem(icon: Icons.music_note, name: 'An Evening With Silk Sonic'),
    UsualItem(icon: Icons.music_note, name: 'Tranquility Base Hotel & Casino'),
    UsualItem(icon: Icons.music_note, name: 'An Evening With Silk Sonic'),
    UsualItem(icon: Icons.music_note, name: 'An Evening With Silk Sonic'),
    UsualItem(icon: Icons.music_note, name: 'An Evening With Silk Sonic'),
  ];

  static List<GenresItem> genres = [
    GenresItem(genre: 'Rock'),
    GenresItem(genre: 'Indie'),
    GenresItem(genre: 'Pop'),
    GenresItem(genre: 'Jazz'),
  ];

  static Color green = Color(0xff1db954);
  static Color black = Color(0xff191414);
  static Color backgroundColor = Color(0xff121212);
  static Color grey = Color(0xff535353);

  static String parachutesUrl = 'https://m.media-amazon.com/images/I/61399lReekL._AC_SL1500_.jpg';
  static String canovaUrl = 'https://rockitecn.nohup.it/thumb1000x1000/copertine/36067/avete-ragione-tutti.jpg';
  static String pinkFloydUrl = 'https://www.leoravera.it/wp-content/uploads/2020/05/Pink-Floyd-Dark-Side-Of-The-Moon.jpg';
  static String silkSonicUrl = 'https://m.media-amazon.com/images/I/91Fa-A1oopL._AC_SL1500_.jpg';
  static double padding = 15;

  static Artist coldplay = Artist('Coldplay');
  static Artist pinkFloyd = Artist('Pink Floyd');
  static Artist canova = Artist('Canova');
  static Artist silkSonic = Artist('SilkSonic');

  static Album aveteRagioneTutti = Album('Avete Ragione Tutti', canovaUrl, canova);
  static Album theDarkSideOfTheMoon = Album('The Dark Side Of The Moon', pinkFloydUrl, pinkFloyd);
  static Album parachutes = Album('Parachutes', parachutesUrl, coldplay);
  static Album anEveningWithSilkSonic = Album('An Evening With Silk Sonig', silkSonicUrl, silkSonic);

  static Song dontPanic = Song(1, "Don't Panic", parachutes, coldplay, 'music/coldplay/Coldplay_-_Don´t_Panic.mp3');
  static Song shiver = Song(2, 'Shiver', parachutes, coldplay, 'music/coldplay/Coldplay_-_Shiver.mp3');
  static Song spies = Song(3, 'Spies', parachutes, coldplay, 'music/coldplay/Coldplay_-_Spies.mp3');
  static Song sparks = Song(4, 'Sparks', parachutes, coldplay, 'music/coldplay/Coldplay_-_Sparks.mp3');
  static Song yellow = Song(5, 'Yellow', parachutes, coldplay, 'music/coldplay/Coldplay_-_Yellow.mp3');
  static Song trouble = Song(6, 'Trouble', parachutes, coldplay, 'music/coldplay/Coldplay_-_Trouble.mp3');
  static Song parachutesSingle = Song(7, 'Parachutes', parachutes, coldplay, 'music/coldplay/Coldplay_-_Parachutes.mp3');
  static Song highSpeed = Song(8, 'High Speed', parachutes, coldplay, 'music/coldplay/Coldplay_-_High_Speed.mp3');
  static Song weNeverChange = Song(9, 'We Never Change', parachutes, coldplay, 'music/coldplay/Coldplay_-_We_Never_Change.mp3');
  static Song everythingsNotLost = Song(10, "Everything's Not Lost", parachutes, coldplay, 'music/coldplay/Coldplay_-_Everything´s_Not_Lost.mp3');
  static Song eskere = Song(12, 'porco', Album('dio', 'cane', Artist('vacco dio')), Artist('lamadonna'), 'eskere');

  static List<Song> allSongs = [
    dontPanic,
    shiver,
    spies,
    sparks,
    yellow,
    trouble,
    parachutesSingle,
    highSpeed,
    weNeverChange,
    everythingsNotLost,
    eskere
  ];
}

class Song {
  int number;
  String songName;
  Album album;
  Artist artist;
  String filePath;
  Song(this.number, this.songName, this.album, this.artist, this.filePath);
}

class Album {
  String albumName;
  String urlAlbum;
  Artist artist;

  Album(this.albumName, this.urlAlbum, this.artist);
}

class Artist {
  String artistName;
  Artist(this.artistName);
}
