import 'package:eb_u201619823/SearchHeroScreen.dart';
import 'package:eb_u201619823/FavoriteHeroesScreen.dart';
import 'package:eb_u201619823/api/SuperHero.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Superhero> favoriteHeroes = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SuperComicsApp'),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.network('https://images6.alphacoders.com/103/1033511.jpg'),
              Container(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            SearchHeroScreen(favoriteHeroes: favoriteHeroes)),
                  );
                },
                child: Text('Buscar Heroes'),
              ),
              Container(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => FavoriteHeroesScreen(
                            favoriteHeroes: favoriteHeroes)),
                  );
                },
                child: const Text('Heroes Favoritos'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
