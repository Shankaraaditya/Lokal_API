import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:local_news_app/functions/api.dart';
import 'package:local_news_app/screens/home.dart';

// import 'package:technewz/backend/functions.dart';
// import 'package:technewz/utils/colors.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({Key? key}) : super(key: key);
  static TextEditingController searchcontroller =
      TextEditingController(text: '');
        

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CupertinoButton(
          onPressed: (){
             FocusScope.of(context).unfocus();
             fetchnews('us');
          },
          child: Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 212, 237, 249),
                borderRadius: BorderRadius.all(Radius.circular(10))
                ),
            child: Icon(
              Icons.search,
              color: Colors.blue,
            ),
          ),
        ),
        Expanded(
          child: Container(
            height: 60,
            margin: EdgeInsets.all(5),
            padding: EdgeInsets.only(left: 10),
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 212, 237, 249),
                borderRadius: BorderRadius.circular(50)),
            child: Center(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(width: 10),
                Expanded(
                    child: TextField(
                      
                  controller: SearchBar.searchcontroller,
                  decoration: InputDecoration(
                      hintText: 'Search in feed',
                      
                      hintStyle: GoogleFonts.lato(),
                      border: InputBorder.none),
                ))
              ],
            )),
          ),
        ),
        
        SizedBox(width: 10)
      ],
    );
  }
}