import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:local_news_app/screens/details.dart';

class NewsBox extends StatelessWidget {
  final String imageurl, title, time, description, url, content;
  const NewsBox({
    Key? key,
    required this.imageurl,
    required this.title,
    required this.time,
    required this.description,
    required this.url,
    required this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(0.0),
      child: Column(
        children: [
          CupertinoButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) =>
                Details(title: title, content: content,description: description,image: imageurl,)
              ));
              
            },
            child: Container(
              height: 150,
              child: Stack(alignment: Alignment.bottomCenter, children: [
                Container(
                  height: 150,
            
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  // margin: EdgeInsets.only(left: 5, right: 5, top: 5),
                  // width: w,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.0),
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                        image: NetworkImage(imageurl), fit: BoxFit.fill),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(bottom: 10, left: 10, right: 10),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 0, sigmaY: 0),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white.withOpacity(0.5)),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Text(
                          title,
                          style: GoogleFonts.ubuntu(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.black),
                        ),
                      ),
                    ),
                  ),
                ),
              ]),
            ),
          ),
          // DividerWidget()
        ],
      ),
    );
  }
}
