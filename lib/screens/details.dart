import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Details extends StatelessWidget {
  final String title, content, description, image;
  const Details(
      {Key? key,
      required this.title,
      required this.content,
      required this.description,
      required this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "Lokal News App",
          style: GoogleFonts.ubuntu(fontWeight: FontWeight.w500, fontSize: 23,color: Colors.black87),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.4,
              decoration: BoxDecoration(
                color: Colors.blueGrey,
                image: DecorationImage(
                    image: NetworkImage(image), fit: BoxFit.cover),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
            child: Container(
              child: Text(
                title,
                style: GoogleFonts.ubuntu(
                    fontSize: 18, fontWeight: FontWeight.w500),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Container(
              child: Text(
                "$description $content",
                style:
                    GoogleFonts.lato(fontSize: 15, fontWeight: FontWeight.w400),
              ),
            ),
          )
        ],
      ),
    );
  }
}
