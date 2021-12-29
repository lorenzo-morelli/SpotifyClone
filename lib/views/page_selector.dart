import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:spotify/services/audio.dart';
import 'package:spotify/views/search.dart';
import 'package:spotify/views/tiny_player/tiny_player.dart';
import 'package:spotify/views/your_library.dart';
import 'home.dart';

class PageSelector extends StatefulWidget {
  const PageSelector({Key? key}) : super(key: key);

  @override
  _PageSelectorState createState() => _PageSelectorState();
}

class _PageSelectorState extends State<PageSelector> {
  int _selectedIndex = 0;
  PageController pageController = PageController();

  AudioController player = AudioController();
  int timeProgress = 0;
  int audioDuration = 0;

  @override
  void initState() {
    super.initState();
    player.init();
    player.audioPlayer.onPlayerStateChanged.listen((PlayerState s) {
      setState(() {
        player.audioPlayerState = s;
      });
    });
    player.audioPlayer.onAudioPositionChanged.listen((Duration p) async {
      setState(() {
        timeProgress = p.inMilliseconds;
      });
    });
    player.audioPlayer.onDurationChanged.listen((Duration d) {
      setState(() {
        audioDuration = d.inMilliseconds;
      });
    });
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: PageView(
        controller: pageController,
        children: [
          Home(player: player),
          Search(),
          YourLibrary(),
        ],
      ),
      bottomNavigationBar: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            height: 130,
            alignment: Alignment.bottomCenter,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: const [Colors.black, Colors.transparent],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                stops: const [0, 0.9],
              ),
            ),
            child: BottomNavigationBar(
              items: const [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
                BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
                BottomNavigationBarItem(icon: Icon(Icons.library_add), label: 'Your library'),
              ],
              currentIndex: _selectedIndex,
              selectedItemColor: Colors.white,
              unselectedItemColor: Colors.grey,
              selectedFontSize: 10,
              unselectedFontSize: 10,
              iconSize: 30,
              elevation: 0,
              backgroundColor: Colors.transparent,
              onTap: changeItem,
            ),
          ),
          Positioned(top: 12, child: TinyPlayer(player: player, audioDuration: audioDuration)),
        ],
      ),
    );
  }

  void changeItem(int index) {
    setState(() {
      _selectedIndex = index;
    });
    pageController.jumpToPage(index);
  }

}