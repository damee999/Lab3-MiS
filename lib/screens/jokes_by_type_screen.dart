import 'package:flutter/material.dart';
import 'package:untitled8/services/api_services.dart';
import 'package:untitled8/models/joke.dart';

class JokesByTypeScreen extends StatefulWidget {
  final String type;
  final List<Joke> favoriteJokes;
  final Function(Joke) onFavorite;
  JokesByTypeScreen({
    required this.type,
    required this.favoriteJokes,
    required this.onFavorite,
  });

  @override
  _JokesByTypeScreenState createState() => _JokesByTypeScreenState();
}

class _JokesByTypeScreenState extends State<JokesByTypeScreen> {
  final ApiServices apiServices = ApiServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("${widget.type} Jokes")),
      body: FutureBuilder<List<Joke>>(
        future: apiServices.fetchJokesByType(widget.type),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            var jokes = snapshot.data!;
            return ListView.builder(
              itemCount: jokes.length,
              itemBuilder: (context, index) {
                var joke = jokes[index];
                bool isFavorite = widget.favoriteJokes.contains(joke);

                return Card(
                  child: ListTile(
                    title: Text(joke.setup),
                    subtitle: Text(joke.punchline),
                    trailing: IconButton(
                      icon: Icon(isFavorite ? Icons.favorite : Icons.favorite_border),
                      color: isFavorite ? Colors.red : null,
                      onPressed: () {
                        widget.onFavorite(joke); // Add/remove joke from favorites
                      },
                    ),
                  ),
                );
              },
            );
          }
          return Center(child: Text('No jokes found'));
        },
      ),
    );
  }
}
