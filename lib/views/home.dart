import 'package:flutter/material.dart';
import 'package:spotify/services/audio.dart';
import 'package:spotify/shared/constants.dart';
import 'home_widgets/jump_back_in.dart';
import 'home_widgets/usual.dart';

class Home extends StatefulWidget {
  const Home({Key? key, required this.player}) : super(key: key);
  final AudioController player;

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: Constants.backgroundColor,
      child: ListView(
        children: [
          SizedBox(height: 40),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: Constants.padding),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Good afternoon', style: TextStyle(fontWeight: FontWeight.w900, fontSize: 25, color: Colors.white)),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      padding: EdgeInsets.zero,
                      icon: Icon(Icons.notifications_on_outlined),
                      color: Colors.white,
                      onPressed: () {},
                    ),
                    IconButton(
                      padding: EdgeInsets.zero,
                      icon: Icon(Icons.history_outlined),
                      color: Colors.white,
                      onPressed: () {},
                    ),
                    IconButton(
                      padding: EdgeInsets.zero,
                      icon: Icon(Icons.settings_outlined),
                      color: Colors.white,
                      onPressed: () => widget.player.changeSong(Constants.trouble),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 15),
          Usual(),
          SizedBox(height: 35),
          JumpBackIn(player: widget.player),
          SizedBox(height: 35),
          JumpBackIn(player: widget.player),
          SizedBox(height: 35),
          JumpBackIn(player: widget.player),
        ],
      ),
    ));
  }
}
