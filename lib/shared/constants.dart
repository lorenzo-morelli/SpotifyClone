import 'package:flutter/material.dart';
import 'package:spotify/views/home_widgets/usual_item.dart';
import 'package:spotify/views/search_widgets/genres_item.dart';

import 'elements.dart';

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
  static Artist silkSonic = Artist('Bruno Mars, Anderson Paak, Silk Sonic');

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

  static Song vitaSociale = Song(1, 'Vita Sociale', aveteRagioneTutti, canova, 'music/canova/Canova_-_Vita_Sociale.mp3');
  static Song brexit = Song(2, 'Brexit', aveteRagioneTutti, canova, 'music/canova/Canova - Brexit.mp3');
  static Song expo = Song(3, 'Expo', aveteRagioneTutti, canova, 'music/canova/Canova - Expo.mp3');
  static Song laFelicita = Song(4, 'La Felicità', aveteRagioneTutti, canova, 'music/canova/Canova - La felicità.mp3');
  static Song manzarek = Song(5, 'Manzarek', aveteRagioneTutti, canova, 'music/canova/Canova - Manzarek.mp3');
  static Song portovenere = Song(6, 'Portovenere', aveteRagioneTutti, canova, 'music/canova/Canova - Portovenere.mp3');
  static Song aziz = Song(7, 'Aziz', aveteRagioneTutti, canova, 'music/canova/Canova - Aziz.mp3');
  static Song maradona = Song(8, 'Maradona', aveteRagioneTutti, canova, 'music/canova/Canova - Maradona (videotributo).mp3');
  static Song laFesta = Song(9, 'La festa - live', aveteRagioneTutti, canova, 'music/canova/Canova - La festa (live session).mp3');

  static Song silkSonicIntro = Song(1, 'Silk Sonic Intro', anEveningWithSilkSonic, silkSonic, 'music/silk_sonic/Bruno-Mars-Anderson-Paak-Silk-Sonic-Silk-Sonic-Intro-(FlexyOkay.com).mp3');
  static Song leaveTheDoorOpen = Song(2, 'Leave The Door Open', anEveningWithSilkSonic, silkSonic, 'music/silk_sonic/Bruno-Mars-Anderson-Paak-Silk-Sonic-Leave-the-Door-Open-(FlexyOkay.com).mp3');
  static Song flyAsMe = Song(3, 'Fly As Me', anEveningWithSilkSonic, silkSonic, 'music/silk_sonic/Bruno-Mars-Anderson-Paak---Silk-Sonic-Fly-As-Me-(FlexyOkay.com).mp3');
  static Song afterLastNight = Song(4, 'After Last Night', anEveningWithSilkSonic, silkSonic, 'music/silk_sonic/Bruno-Mars-Anderson-Paak---Silk-Sonic-After-Last-Night--feat-Thundercat---Bootsy-Collins--(FlexyOkay.com).mp3');
  static Song smokingOutTheWindow = Song(5, 'Smokin Out The Window', anEveningWithSilkSonic, silkSonic, 'music/silk_sonic/Bruno-Mars-Anderson-Paak-Silk-Sonic-Smokin-Out-The-Window-(FlexyOkay.com).mp3');
  static Song putOnASmile = Song(6, 'Put On A Smile', anEveningWithSilkSonic, silkSonic, 'music/silk_sonic/Bruno-Mars-Anderson-Paak---Silk-Sonic-Put-On-A-Smile-(FlexyOkay.com).mp3');
  static Song song777 = Song(7, '777', anEveningWithSilkSonic, silkSonic, 'music/silk_sonic/Bruno-Mars-Anderson-Paak---Silk-Sonic-777-(FlexyOkay.com).mp3');
  static Song skate = Song(8, 'Skate', anEveningWithSilkSonic, silkSonic, 'music/silk_sonic/Bruno-Mars-Anderson-Paak-Silk-Sonic-Skate-(FlexyOkay.com).mp3');
  static Song blastOff = Song(9, 'Blast Off', anEveningWithSilkSonic, silkSonic, 'music/silk_sonic/Bruno-Mars-Anderson-Paak---Silk-Sonic-Blast-Off-(FlexyOkay.com).mp3');
  static List<Elements> allElements = [
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
    vitaSociale,
    brexit,
    expo,
    laFelicita,
    manzarek,
    portovenere,
    aziz,
    maradona,
    laFesta,
    silkSonicIntro,
    leaveTheDoorOpen,
    song777,
    blastOff,
    flyAsMe,
    afterLastNight,
    skate,
    smokingOutTheWindow,
    putOnASmile,
    canova,
    coldplay,
    silkSonic,
    pinkFloyd,
    parachutes,
    anEveningWithSilkSonic,
    theDarkSideOfTheMoon,
    aveteRagioneTutti,
  ];

  static List<Elements> history = [];
}
