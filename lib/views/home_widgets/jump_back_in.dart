import 'package:flutter/material.dart';
import 'package:spotify/shared/constants.dart';
import 'package:spotify/views/home_widgets/jump_back_in_item.dart';

class JumpBackIn extends StatefulWidget {
  const JumpBackIn({Key? key}) : super(key: key);

  @override
  _JumpBackInState createState() => _JumpBackInState();
}

class _JumpBackInState extends State<JumpBackIn> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Jump back in', style: TextStyle(fontWeight: FontWeight.w700, fontSize: 23, color: Colors.white)),
          SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                JumpBackInItem(album: Constants.aveteRagioneTutti),
                JumpBackInItem(album: Constants.theDarkSideOfTheMoon, ),
                JumpBackInItem(album: Constants.parachutes),
                JumpBackInItem(album: Constants.anEveningWithSilkSonic),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
