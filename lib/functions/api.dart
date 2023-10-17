import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:local_news_app/screens/search.dart';

import 'package:welltested_annotation/welltested_annotation.dart';

// import 'package:technewz/components/searchbar.dart';

@Welltested()
Future<List> fetchnews(String country) async {
  List<String> empty = [];

  final response = await http.get(
    Uri.parse(
        'https://newsapi.org/v2/top-headlines?country=$country&category=technology&pageSize=100&apiKey=6708064862b7410f80fdcc17090b7497&q=us'),
  );

  if (response.statusCode == 200) {
    Map result = jsonDecode(response.body);

    return (result['articles']);
  }

  else {
    throw Exception(); 
  }
}
