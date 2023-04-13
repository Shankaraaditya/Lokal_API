import 'package:flutter/material.dart';
import 'package:local_news_app/screens/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // brightness: Brightness.dark,
        scaffoldBackgroundColor: Color.fromARGB(255, 212, 237, 249)
      ),
      home: HomePage(),
    );
  }
}

