import 'package:flutter/material.dart';
import 'package:spotify/views/player/player.dart';

class TinyPlayer extends StatefulWidget {
  const TinyPlayer({Key? key}) : super(key: key);

  @override
  _TinyPlayerState createState() => _TinyPlayerState();
}

class _TinyPlayerState extends State<TinyPlayer> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.symmetric(horizontal: 7),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: Colors.grey[700],
        ),
        height: 58,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      height: 56,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 5, bottom: 5, left: 5, right: 8),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(4),
                            child: Image.network(
                              'https://static.wixstatic.com/media/66ca42_aef55d220d214050a3f01a72eb2ac9c2~mv2.jpeg/v1/fill/w_900,h_900,al_c,q_90/66ca42_aef55d220d214050a3f01a72eb2ac9c2~mv2.jpeg',
                            )),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Why Are Sundays So Depressing',
                          style: TextStyle(fontWeight: FontWeight.bold),
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text('The Strokes', style: TextStyle(color: Colors.grey[300])),
                      ],
                    ),
                  ],
                ),
                SizedBox(width: 10),
                Icon(Icons.favorite, color: Colors.green, size: 25),
                Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: Icon(Icons.play_arrow, color: Colors.white, size: 35),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: SliderTheme(
                data: SliderThemeData(
                  trackHeight: 0.5,
                  overlayShape: SliderComponentShape.noOverlay,
                  thumbShape: RoundSliderThumbShape(enabledThumbRadius: 0),
                ),
                child: Slider(
                  inactiveColor: Colors.transparent,
                  activeColor: Colors.white,
                  onChanged: (val) {},
                  value: 15.0,
                  min: 0,
                  max: 100,
                ),
              ),
            ),
          ],
        ),
      ),
      onTap: () => showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (context) => Player(),
      ),
    );
  }
}
