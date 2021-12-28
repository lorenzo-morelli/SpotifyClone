import 'package:flutter/material.dart';

class JumpBackInItem extends StatefulWidget {
  const JumpBackInItem({Key? key, required this.title, required this.artist, required this.url}) : super(key: key);
  final String title;
  final String artist;
  final String url;

  @override
  _JumpBackInItemState createState() => _JumpBackInItemState();
}

class _JumpBackInItemState extends State<JumpBackInItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10, bottom: 10, right: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
              height: 160,
              width: 160,
              child: Image.network(widget.url),
          ),
          SizedBox(height: 10),
          Text(widget.title, style: TextStyle(fontWeight: FontWeight.w600)),
          Text('Album • ${widget.artist}', style: TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }
}
