import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:untitled8/models/joke.dart';

class ApiServices {
  static const String baseUrl = "https://official-joke-api.appspot.com";

  Future<List<String>> fetchJokeTypes() async {
    final response = await http.get(Uri.parse('$baseUrl/types'));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return List<String>.from(data);
    } else {
      throw Exception('Failed to load joke types');
    }
  }

  Future<List<Joke>> fetchJokesByType(String type) async {
    final response = await http.get(Uri.parse('$baseUrl/jokes/$type/ten'));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((joke) => Joke.fromJson(joke)).toList();
    } else {
      throw Exception('Failed to load jokes');
    }
  }

  Future<Joke> fetchRandomJoke() async {
    final response = await http.get(Uri.parse('$baseUrl/random_joke'));

    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      return Joke.fromJson(data);
    } else {
      throw Exception('Failed to load random joke');
    }
  }
}
