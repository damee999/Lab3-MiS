import 'package:flutter/material.dart';

class JokeCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final VoidCallback onTap;
  final VoidCallback onFavorite;

  JokeCard({
    required this.title,
    required this.subtitle,
    required this.onTap,
    required this.onFavorite,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(title),
        subtitle: Text(subtitle),
        trailing: IconButton(
          icon: Icon(Icons.favorite_border),
          onPressed: onFavorite,
        ),
        onTap: onTap,
      ),
    );
  }
}
