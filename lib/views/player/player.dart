import 'package:flutter/material.dart';
import 'package:spotify/shared/constants.dart';

class Player extends StatefulWidget {
  const Player({Key? key}) : super(key: key);

  @override
  _PlayerState createState() => _PlayerState();
}

class _PlayerState extends State<Player> {
  var currentTime = 15.0;

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
                SizedBox(height: 60),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      child: Icon(Icons.arrow_downward, color: Colors.white),
                      onTap: () => Navigator.pop(context),
                    ),
                    Column(
                      children: const [
                        Text('PLAYING FROM ALBUM', style: TextStyle(fontSize: 12)),
                        Text('Parachutes', style: TextStyle(fontWeight: FontWeight.w500)),
                      ],
                    ),
                    Icon(Icons.more_vert_sharp, color: Colors.white)
                  ],
                ),
                SizedBox(height: 32),
                Image.network(Constants.parachutesUrl),
                SizedBox(height: 32),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Trouble', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                        Text('Coldplay', style: TextStyle(fontSize: 15, color: Colors.grey[400])),
                      ],
                    ),
                    Icon(Icons.favorite, color: Colors.green),
                  ],
                ),
                SizedBox(height: 20),
                SliderTheme(
                  data: SliderThemeData(
                    thumbShape: RoundSliderThumbShape(enabledThumbRadius: 5),
                    trackHeight: 1.3,
                    overlayShape: SliderComponentShape.noOverlay,
                  ),
                  child: Slider(
                    activeColor: Colors.white,
                    inactiveColor: Colors.white24,
                    min: 0,
                    max: 100,
                    value: currentTime,
                    onChanged: (val) {},
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 6),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('0:21', style: TextStyle(color: Colors.grey[400])),
                      Text('4:29', style: TextStyle(color: Colors.grey[400])),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.shuffle_rounded, color: Colors.white, size: 25),
                    SizedBox(width: 25),
                    Icon(Icons.fast_rewind, color: Colors.white, size: 40),
                    SizedBox(width: 25),
                    Icon(Icons.pause_circle_filled, color: Colors.white, size: 90),
                    SizedBox(width: 25),
                    Icon(Icons.fast_forward, color: Colors.white, size: 40),
                    SizedBox(width: 25),
                    Icon(Icons.repeat_outlined, color: Colors.white, size: 25),
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
                      children: const [
                        Icon(Icons.share_outlined, color: Colors.white, size: 20),
                        SizedBox(width: 25),
                        Icon(Icons.queue_music, color: Colors.white),
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
                      color: Color(0xffc2822f),
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
