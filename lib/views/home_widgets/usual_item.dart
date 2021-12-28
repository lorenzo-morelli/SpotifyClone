import 'package:flutter/material.dart';
import 'package:spotify/shared/constants.dart';

class UsualItem extends StatelessWidget {
  const UsualItem({Key? key, required this.icon, required this.name}) : super(key: key);
  final IconData icon;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xff2a2a2a),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        children: [
          ClipRRect(
              child: Image.network(Constants.silkSonicUrl),
            borderRadius: BorderRadius.only(topLeft: Radius.circular(6), bottomLeft: Radius.circular(7)),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(name, style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: Colors.white)),
            ),
          ),
        ],
      ),
    );
  }
}
