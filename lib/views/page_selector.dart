import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:spotify/services/audio.dart';
import 'package:spotify/shared/constants.dart';
import 'package:spotify/views/search.dart';
import 'package:spotify/views/tiny_player/tiny_player.dart';
import 'package:spotify/views/your_library.dart';
import 'elements/album.dart';
import 'home.dart';

class PageSelector extends StatefulWidget {
  const PageSelector({Key? key}) : super(key: key);

  @override
  _PageSelectorState createState() => _PageSelectorState();
}

class _PageSelectorState extends State<PageSelector> {
  int _selectedIndex = 0;
  int timeProgress = 0;
  int audioDuration = 0;

  @override
  void initState() {
    super.initState();
    Constants.player.init();
    Constants.player.audioPlayer.onPlayerStateChanged.listen((PlayerState s) {
      setState(() {
        Constants.player.audioPlayerState = s;
      });
    });
    Constants.player.audioPlayer.onAudioPositionChanged.listen((Duration p) async {
      setState(() {
        timeProgress = p.inMilliseconds;
      });
    });
    Constants.player.audioPlayer.onDurationChanged.listen((Duration d) async {
      setState(() {
        audioDuration = d.inMilliseconds;
      });
    });
  }

  @override
  void dispose() {
    Constants.player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: WillPopScope(
        onWillPop: () async {
          if (Constants.navigatorKey.currentState!.canPop()) {
            Constants.navigatorKey.currentState!.pop();
            return false;
          }
          return true;
        },
        child: Navigator(
          key: Constants.navigatorKey,
          initialRoute: '/',
          onGenerateRoute: (RouteSettings settings) {
            WidgetBuilder builder;
            // Manage your route names here
            switch (settings.name) {
              case '/':
                builder = (BuildContext context) => Home();
                break;
              case '/search':
                builder = (BuildContext context) => Search();
                break;
              case '/your_library':
                builder = (BuildContext context) => YourLibrary();
                break;
              case '/album':
                builder = (BuildContext context) => AlbumPage(album: Constants.currentAlbum!);
                break;
              default:
                throw Exception('Invalid route: ${settings.name}');
            }

            return MaterialPageRoute(
              builder: builder,
              settings: settings,
            );
          },
        ),
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
              items: [
                BottomNavigationBarItem(
                  icon: IconButton(
                    icon: Icon(Foundation.home),
                    alignment: Alignment.bottomCenter,
                    padding: EdgeInsets.only(bottom: 5),
                    iconSize: 27,
                    onPressed: () {
                      changeItem(0);
                      Constants.navigatorKey.currentState!.pushNamedAndRemoveUntil('/', (Route<dynamic> route) => false);
                    },
                  ),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: IconButton(
                    icon: Icon(AntDesign.search1),
                    alignment: Alignment.bottomCenter,
                    padding: EdgeInsets.only(bottom: 5),
                    iconSize: 25,
                    onPressed: () {
                      changeItem(1);
                      Constants.navigatorKey.currentState!.pushNamedAndRemoveUntil('/search', (Route<dynamic> route) => false);
                    },
                  ),
                  label: 'Search',
                ),
                BottomNavigationBarItem(
                    icon: IconButton(
                      icon: Icon(Ionicons.md_book),
                      alignment: Alignment.bottomCenter,
                      padding: EdgeInsets.only(bottom: 5),
                      iconSize: 27,
                      onPressed: () {
                        changeItem(2);
                        Constants.navigatorKey.currentState!.pushNamedAndRemoveUntil('/your_library', (Route<dynamic> route) => false);
                      },
                    ),
                    label: 'Your library'),
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
          AudioController.playingSong != null ? Positioned(top: 12, child: TinyPlayer(audioDuration: audioDuration)) : Container(),
        ],
      ),
    );
  }

  void changeItem(int index) => setState(() => _selectedIndex = index);
}
