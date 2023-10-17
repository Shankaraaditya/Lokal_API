import 'fetchnews.welltested_test.mocks.dart';
import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart' as testMock;
import 'package:http/testing.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:local_news_app/functions/api.dart';

@GenerateMocks([http.Client])
void main() {
  group('fetchnews', () {
    final clientMock = testMock.MockClient;

    test('fetchnews returns a list of articles when the API call is successful',
        () async {
      // Arrange
      final response = http.Response(
        json.encode({
          'articles': [
            {
              'source': {'id': 'techcrunch', 'name': 'TechCrunch'},
              'author': 'Author1',
              'title': 'Article1',
              'description': 'Description1',
              'url': 'https://example.com/article1',
              'urlToImage': 'https://example.com/image1.jpg',
              'publishedAt': '2021-09-01T00:00:00Z',
              'content': 'Content1',
            },
            {
              'source': {'id': 'techcrunch', 'name': 'TechCrunch'},
              'author': 'Author2',
              'title': 'Article2',
              'description': 'Description2',
              'url': 'https://example.com/article2',
              'urlToImage': 'https://example.com/image2.jpg',
              'publishedAt': '2021-09-02T00:00:00Z',
              'content': 'Content2',
            },
          ],
        }),
        200,
      );
      // when(clientMock).thenAnswer((_) async => response);

      // Act
      final result = await fetchnews('us');

      // Assert
      expect(result, [
        {
          'source': {'id': 'techcrunch', 'name': 'TechCrunch'},
          'author': 'Author1',
          'title': 'Article1',
          'description': 'Description1',
          'url': 'https://example.com/article1',
          'urlToImage': 'https://example.com/image1.jpg',
          'publishedAt': '2021-09-01T00:00:00Z',
          'content': 'Content1',
        },
        {
          'source': {'id': 'techcrunch', 'name': 'TechCrunch'},
          'author': 'Author2',
          'title': 'Article2',
          'description': 'Description2',
          'url': 'https://example.com/article2',
          'urlToImage': 'https://example.com/image2.jpg',
          'publishedAt': '2021-09-02T00:00:00Z',
          'content': 'Content2',
        },
      ]);
    });

    // test('fetchnews throws an exception when the API call fails', () async {
    //   // Arrange
    //   final response = http.Response('Failed to load news', 500);
    //   // when(clientMock.get(any)).thenAnswer((_) async => response);

    //   // Act
    //   Future<List> call = fetchnews('us');

    //   // Assert
    //   expect(call, throwsException);
    // });
  });
}
