import 'package:flutter/material.dart';
import 'package:spotify/shared/constants.dart';
import 'package:spotify/shared/elements.dart';
import 'package:spotify/views/search_widgets/search_result.dart';

class Searching extends StatefulWidget {
  const Searching({Key? key}) : super(key: key);

  @override
  _SearchingState createState() => _SearchingState();
}

class _SearchingState extends State<Searching> {
  List<Elements> search = [];
  String query = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: TextField(
          autofocus: true,
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
            hintText: 'Search query',
            hintStyle: TextStyle(color: Color(0xffcccccc)),
            border: InputBorder.none,
          ),
          onChanged: (val) => setState(() {
            print(query);
            query = val;
            search = Constants.allElements.where((elem) {
              query = query.toLowerCase();
              if (elem is Song) {
                var name = elem.songName.toLowerCase();
                return name.startsWith(query);
              }
              if (elem is Artist) {
                var name = elem.artistName.toLowerCase();
                return name.startsWith(query);
              }
              if (elem is Album) {
                var name = elem.albumName;
                return name.startsWith(query);
              } else {
                return false;
              }
            }).toList();
          }),
        ),
        elevation: 0,
        backgroundColor: Constants.grey,
        toolbarHeight: 50,
      ),
      backgroundColor: Constants.backgroundColor,
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 12),
        child: query.isEmpty
            ? ListView(
                children: [
                  Text('Recent searches', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                  Constants.history.isNotEmpty
                      ? ListView.builder(
                          shrinkWrap: true,
                          itemCount: Constants.history.length,
                          itemBuilder: (context, index) {
                            return SearchResult(result: Constants.history[index]);
                          })
                      : Text('nulla recente'),
                ],
              )
            : search.isNotEmpty
                ? ListView.builder(
                    padding: EdgeInsets.only(bottom: 40),
                    itemCount: search.length,
                    itemBuilder: (context, index) {
                      return SearchResult(result: search[index]);
                    })
                : Text('trovato nada'),
      ),
    );
  }
}
