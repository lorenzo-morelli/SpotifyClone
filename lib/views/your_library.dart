import 'package:flutter/material.dart';
import 'package:spotify/shared/constants.dart';

class YourLibrary extends StatefulWidget {
  const YourLibrary({Key? key}) : super(key: key);

  @override
  _YourLibraryState createState() => _YourLibraryState();
}

class _YourLibraryState extends State<YourLibrary> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.backgroundColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(120),
        child: AppBar(
          backgroundColor: Constants.backgroundColor,
          elevation: 5,
          flexibleSpace: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: Constants.padding),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: const [
                        CircleAvatar(
                          backgroundColor: Colors.red,
                          radius: 17,
                        ),
                        SizedBox(width: 20),
                        Text('Your Library', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700, letterSpacing: -1)),
                      ],
                    ),
                    Row(
                      children: const [
                        Icon(Icons.search, color: Colors.white),
                        SizedBox(width: 15),
                        Icon(Icons.add, color: Colors.white, size: 30),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 15, left: Constants.padding, bottom: 10),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(100), border: Border.all(color: Colors.white70)),
                        child: Text('Playlist', style: TextStyle(fontSize: 14)),
                      ),
                      SizedBox(width: 10),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(100), border: Border.all(color: Colors.white70)),
                        child: Text('Album', style: TextStyle(fontSize: 14)),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.only(left: Constants.padding, right: Constants.padding, top: Constants.padding),
            child: ListView(
              shrinkWrap: true,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: const [
                        Icon(Icons.sort, color: Colors.white),
                        SizedBox(width: 10),
                        Text('Alphabetical order'),
                      ],
                    ),
                    Icon(Icons.grid_view, color: Colors.white, size: 22),
                  ],
                ),
                ListView(
                  shrinkWrap: true,
                  children: const [
                    Text('Lesghere'),
                    Text('EEE'),
                    Text('OOO'),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
