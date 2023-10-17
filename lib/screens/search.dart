import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:local_news_app/functions/api.dart';
import 'package:local_news_app/screens/home.dart';

// import 'package:technewz/backend/functions.dart';
// import 'package:technewz/utils/colors.dart';

class SearchBarWidget extends StatefulWidget {


  
  String country;
  SearchBarWidget({Key? key, required this.country}) : super(key: key);
  static TextEditingController searchcontroller =
      TextEditingController(text: '');

  @override
  _SearchBarWidgetState createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends State<SearchBarWidget> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: SearchBarWidget.searchcontroller,
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
