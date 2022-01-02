import 'package:flutter/material.dart';
import 'package:spotify/shared/constants.dart';

class JumpBackInItem extends StatefulWidget {
  const JumpBackInItem({Key? key, required this.album}) : super(key: key);
  final Album album;

  @override
  _JumpBackInItemState createState() => _JumpBackInItemState();
}

class _JumpBackInItemState extends State<JumpBackInItem> {
  double size = 165;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10, bottom: 10, right: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IconButton(
            padding: EdgeInsets.zero,
            iconSize: size,
            icon: Image.network(widget.album.urlAlbum),
            onPressed: () {
              Constants.currentAlbum = widget.album;
              Constants.navigatorKey.currentState!.pushNamed('/album');
            },
          ),
          SizedBox(height: 10),
          SizedBox(
            width: size,
            child: Text(widget.album.albumName,
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 13.5), overflow: TextOverflow.ellipsis),
          ),
          SizedBox(
            width: size,
            child: Text('Album • ${widget.album.artist.artistName}',
                style: TextStyle(color: Colors.grey, fontSize: 13), overflow: TextOverflow.ellipsis),
          ),
        ],
      ),
    );
  }
}
