import 'package:flutter/material.dart';

class SearchBar extends StatefulWidget {
  final double height;

  const SearchBar({
    Key? key,
    required this.height,
  }) : super(key: key);

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Padding(
        padding: const EdgeInsets.only(left: 16),
        child: TextField(
          controller: controller,
          style: TextStyle(color: Colors.black, fontFamily: ''),
        ),
      ),
    );
  }
}
