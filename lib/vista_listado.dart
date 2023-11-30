import 'package:eb_u201619823/api/SuperHero.dart';
import 'package:eb_u201619823/database/database.dart';
import 'package:flutter/material.dart';
import 'package:drift/native.dart';
import 'package:drift/drift.dart' as dr;

class FavoriteHeroesScreen extends StatelessWidget {
  final List<Superhero> favoriteHeroes;

  FavoriteHeroesScreen({required this.favoriteHeroes});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Heroes favoritos'),
      ),
      body: favoriteHeroes.isEmpty
          ? Center(
              child: Text(
                'No hay héroes favoritos.',
                style: TextStyle(fontSize: 18.0),
              ),
            )
          : ListView.builder(
              itemCount: favoriteHeroes.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(favoriteHeroes[index].name),
                  subtitle: Text(
                      'Intelligence: ${favoriteHeroes[index].intelligence}'),
                  leading: Container(
                    width: 60.0,
                    height: 60.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(favoriteHeroes[index].image),
                      ),
                    ),
                  ),
                  trailing: Text('Gender: ${favoriteHeroes[index].gender}'),
                );
              },
            ),
    );
  }
}
