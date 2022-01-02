import 'package:flutter/material.dart';
import 'package:spotify/services/audio.dart';
import 'package:spotify/shared/constants.dart';
import 'package:spotify/views/home_widgets/jump_back_in_item.dart';
import 'package:spotify/views/search_widgets/genres.dart';
import 'package:spotify/views/search_widgets/search_bar.dart';
import 'package:spotify/views/search_widgets/search_button.dart';
import 'package:spotify/views/search_widgets/section_header_delegate.dart';
import 'package:spotify/views/searching.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.backgroundColor,
      body: SafeArea(
        bottom: false,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: Constants.padding),
          child: CustomScrollView(slivers: [
            SliverList(
              delegate: SliverChildListDelegate([
                SizedBox(height: 50),
                Text('Search', style: TextStyle(fontSize: 30, fontWeight: FontWeight.w800)),
                SizedBox(height: 18),
              ]),
            ),
            SliverPersistentHeader(
              pinned: true,
              delegate: SectionHeaderDelegate(
                height: 45,
                child: GestureDetector(
                  child: SearchButton(),
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => Searching())),
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate([
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: Text('Your top genres', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
                ),
                Genres(),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: Text('Browse all', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
                ),
                Genres(),
              ]),
            )
          ]),
        ),
      ),
    );
  }
}
