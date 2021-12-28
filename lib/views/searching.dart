import 'package:flutter/material.dart';
import 'package:spotify/shared/constants.dart';

class Searching extends StatefulWidget {
  const Searching({Key? key}) : super(key: key);

  @override
  _SearchingState createState() => _SearchingState();
}

class _SearchingState extends State<Searching> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
            hintText: 'Search query',
            hintStyle: TextStyle(color: Color(0xffcccccc)),
            border: InputBorder.none,
          ),
        ),
        elevation: 0,
        backgroundColor: Constants.grey,
        toolbarHeight: 50,
      ),
      backgroundColor: Constants.backgroundColor,
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 25, horizontal: 20),
        child: ListView(
          children: const [
            Text('Recent searches', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            ListTile(
              contentPadding: EdgeInsets.all(0),
              leading: CircleAvatar(
                radius: 22,
                backgroundColor: Colors.red,
              ),
              title: Text('Ernia', style: TextStyle(color: Colors.white)),
              subtitle: Text('Artist', style: TextStyle(color: Color(0xffcccccc))),
              trailing: Icon(Icons.close, color: Colors.white, size: 30),
            ),
            ListTile(
              contentPadding: EdgeInsets.all(0),
              leading: CircleAvatar(
                radius: 22,
                backgroundColor: Colors.red,
              ),
              title: Text('Canova', style: TextStyle(color: Colors.white)),
              subtitle: Text('Artist', style: TextStyle(color: Color(0xffcccccc))),
              trailing: Icon(Icons.close, color: Colors.white, size: 30),
            ),
          ],
        ),
      ),
    );
  }
}
