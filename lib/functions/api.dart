import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:local_news_app/screens/search.dart';

// import 'package:technewz/components/searchbar.dart';

Future<List> fetchnews( String country) async {
  final response = await http.get(
    Uri.parse(
        'https://newsapi.org/v2/top-headlines?country=$country&category=technology&pageSize=100&apiKey=6708064862b7410f80fdcc17090b7497&q=${SearchBar.searchcontroller.text}'),
  );
  Map result = jsonDecode(response.body);
  print('Fetched');
  // print(result);

  return (result['articles']);
}
