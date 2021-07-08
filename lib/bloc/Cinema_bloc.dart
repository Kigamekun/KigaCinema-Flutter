import 'package:kiga_cinema/model/Cinema.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<List<Album>> fetchAlbum() async {
  final response =
      await http.get(Uri.parse("http://192.168.1.57:8000/api/get_cinema"));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    var responseJson = jsonDecode(response.body);
    return (responseJson['cinema'] as List)
        .map((p) => Album.fromJson(p))
        .toList();
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}