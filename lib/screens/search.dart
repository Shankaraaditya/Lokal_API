import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:local_news_app/functions/api.dart';
import 'package:local_news_app/screens/home.dart';

// import 'package:technewz/backend/functions.dart';
// import 'package:technewz/utils/colors.dart';

class SearchBar extends StatefulWidget {
  String country;
  SearchBar({Key? key, required this.country}) : super(key: key);
  static TextEditingController searchcontroller =
      TextEditingController(text: '');

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: SearchBar.searchcontroller,
      decoration: InputDecoration(
          hintText: 'Search in feed',
          hintStyle: GoogleFonts.lato(),
          border: InputBorder.none),
      onChanged: (value) {
        fetchnews('us');
      },
    );
  }
}
