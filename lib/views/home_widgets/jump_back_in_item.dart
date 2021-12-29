import 'package:flutter/material.dart';
import 'package:spotify/shared/constants.dart';

class JumpBackInItem extends StatefulWidget {
  const JumpBackInItem({Key? key, required this.album}) : super(key: key);
  final Album album;

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
              child: Image.network(widget.album.urlAlbum),
          ),
          SizedBox(height: 10),
          Text(widget.album.albumName, style: TextStyle(fontWeight: FontWeight.w600)),
          Text('Album • ${widget.album.artist}', style: TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }
}
