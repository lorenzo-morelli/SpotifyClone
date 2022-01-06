import 'package:flutter/material.dart';
import 'package:spotify/services/dismiss_keyboard.dart';
import 'package:spotify/shared/constants.dart';
import 'package:spotify/views/page_selector.dart';
import 'package:spotify/views/search.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DismissKeyboard(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: Constants.theme,
        home: PageSelector(),
      ),
    );
  }
}