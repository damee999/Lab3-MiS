import 'package:flutter/material.dart';
import 'package:untitled8/models/joke.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Joke> favoriteJokes;

  // Constructor to accept the favorite jokes list
  FavoritesScreen({required this.favoriteJokes});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Favorite Jokes')),
      body: favoriteJokes.isEmpty
          ? Center(child: Text('No favorite jokes yet!'))
          : ListView.builder(
        itemCount: favoriteJokes.length,
        itemBuilder: (context, index) {
          var joke = favoriteJokes[index];
          return Card(
            child: ListTile(
              title: Text(joke.setup),
              subtitle: Text(joke.punchline),
            ),
          );
        },
      ),
    );
  }
}
