import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:local_news_app/functions/api.dart';
import 'package:local_news_app/screens/news.dart';
import 'package:local_news_app/screens/search.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    fetchnews();
  }

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    return SafeArea(
      
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          centerTitle: true,
          title:  Text("Local App",style: GoogleFonts.ubuntu(fontWeight: FontWeight.bold,fontSize: 25),),
        ),
        body: Column(children: [
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Container(
              height: 60,
              width: w * 0.9,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(50))
              ),

              child:const SearchBar(),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Container(
                  // width: w-120,
                  child: FutureBuilder<List>(
                future: fetchnews(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          return NewsBox(
                            url: snapshot.data![index]['url'],
                            imageurl: snapshot.data![index]['urlToImage'] ?? 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQGkAznCVTAALTD1o2mAnGLudN9r-bY6klRFB35J2hY7gvR9vDO3bPY_6gaOrfV0IHEIUo&usqp=CAU',
                            title: snapshot.data![index]['title'],
                            time: snapshot.data![index]['publishedAt'],
                            description:
                                snapshot.data![index]['description'].toString(),
                          );
                        });
                  } else if (snapshot.hasError) {
                    return Text("${snapshot.error}");
                  }

                  // By default, show a loading spinner.
                  return const Center(
                      child: CircularProgressIndicator(
                    color: Colors.blue,         
          ),);
                },
              )),
            ),
          ),
        ]),
      ),
    );
  }
}