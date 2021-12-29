import 'package:flutter/material.dart';
import 'package:spotify/shared/constants.dart';
import 'package:spotify/views/home_widgets/usual_item.dart';

class Usual extends StatefulWidget {
  const Usual({Key? key}) : super(key: key);

  @override
  _UsualState createState() => _UsualState();
}

class _UsualState extends State<Usual> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Constants.padding),
      child: IgnorePointer(
        child: GridView.count(
          childAspectRatio: 2.9,
          crossAxisCount: 2,
          mainAxisSpacing: 9,
          crossAxisSpacing: 9,
          shrinkWrap: true,
          children: Constants.usuals,
        ),
      ),
    );
  }
}
