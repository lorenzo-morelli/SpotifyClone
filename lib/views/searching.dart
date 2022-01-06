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
  var controller = TextEditingController();
  List<Elements> search = [];
  String query = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: TextField(
          controller: controller,
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
            hintText: 'Search query',
            hintStyle: TextStyle(color: Color(0xffcccccc)),
            border: InputBorder.none,
          ),
          onChanged: (val) => setState(() {
            query = val;
            search = Constants.allElements.where((elem) {
              if (elem is Song) {
                return elem.songName.contains(query);
              }
              else if (elem is Artist) {
                return elem.artistName.contains(query);
              }
              else if (elem is Album) {
                return elem.albumName.contains(query);
              }
              else {
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
        padding: EdgeInsets.symmetric(vertical: 25, horizontal: 12),
        child: query.isEmpty
            ? ListView(
                children: [
                  Text('Recent searches', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                  Constants.results.isNotEmpty
                      ? ListView.builder(
                          shrinkWrap: true,
                          itemCount: Constants.results.length,
                          itemBuilder: (context, index) {
                            return SearchResult(result: Constants.results[index]);
                          })
                      : Text('no'),
                ],
              )
            : search.isNotEmpty ? ListView.builder(
                itemCount: search.length,
                itemBuilder: (context, index) {
                  return SearchResult(result: search[index]);
                },
              ) : Text('trovato nada'),
      ),
    );
  }
}
