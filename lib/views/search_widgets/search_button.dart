import 'package:flutter/material.dart';

class SearchButton extends StatelessWidget {
  const SearchButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        children: const [
          Icon(Icons.search),
          SizedBox(width: 10),
          Text('Artists, songs, podcasts', style: TextStyle(color: Color(0xff535353), fontWeight: FontWeight.bold, fontSize: 16)),
        ],
      ),
    );
  }
}
