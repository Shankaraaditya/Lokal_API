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
    fetchnews(selected!);
  }

  List<String> items = <String>['in', 'us', 'ae', 'il', 'jp'];
  String? selected = 'in';
  

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color.fromARGB(255, 212, 237, 249),
        centerTitle: true,
        title: Text(
          "Local App",
          style: GoogleFonts.ubuntu(
              fontWeight: FontWeight.bold,
              fontSize: 25,
              color: Colors.black87),
        ),
      ),
      body: Column(children: [
        // Container(
        //   // height: 60,
        //   // width: w * 0.9,
        //   decoration: const BoxDecoration(
        //       // color: Colors.white,
        //       borderRadius: BorderRadius.all(Radius.circular(50))),
        //   // child:  SearchBar(country: selected!,),
        // ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Container(
            padding: EdgeInsets.only(left: 20),
             decoration: BoxDecoration(
              border: Border.all(width: 1, color: Colors.grey),
              borderRadius: BorderRadius.all(Radius.circular(50)),
               ), 
            child: SearchBar(country: selected!),),
        ),
        
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Country :" ,
            style: GoogleFonts.ubuntu(fontSize: 20),
            ),
            SizedBox(width: 10,),
            DropdownButton<String>(
              value: selected,
              items: items
                  .map((item) => DropdownMenuItem<String>(
                        value: item,
                        child: Text(item),
                      ))
                  .toList(),
              onChanged: (String? newvalue) {
                setState(() {
                  selected = newvalue;
                  fetchnews(selected!);
                });
              },
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Container(
                // width: w-120,
                child: FutureBuilder<List>(
              future: fetchnews(selected!),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        return NewsBox(
                          url: snapshot.data![index]['url'],
                          imageurl: snapshot.data![index]['urlToImage'] ??
                              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQGkAznCVTAALTD1o2mAnGLudN9r-bY6klRFB35J2hY7gvR9vDO3bPY_6gaOrfV0IHEIUo&usqp=CAU',
                          title: snapshot.data![index]['title'],
                          time: snapshot.data![index]['publishedAt'],
                          description:
                              snapshot.data![index]['description'].toString(),
                          content:
                              snapshot.data![index]['content'].toString(),
                        );
                      });
                } else if (snapshot.hasError) {
                  return Text("${snapshot.error}");
                }

                // By default, show a loading spinner.
                return const Center(
                  child: CircularProgressIndicator(
                    color: Colors.blue,
                  ),
                );
              },
            )),
          ),
        ),
      ]),
    );
  }
}
