import 'package:flutter/material.dart';
import 'package:spotify/views/home_widgets/usual.dart';
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
}
