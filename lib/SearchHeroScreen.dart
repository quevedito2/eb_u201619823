import 'package:eb_u201619823/api/SuperHero.dart';
import 'package:eb_u201619823/api/Service.dart';
import 'package:flutter/material.dart';

class SearchHeroScreen extends StatefulWidget {
  final List<Superhero> favoriteHeroes;

  SearchHeroScreen({required this.favoriteHeroes});

  @override
  _SearchHeroScreenState createState() => _SearchHeroScreenState();
}

class _SearchHeroScreenState extends State<SearchHeroScreen> {
  TextEditingController _searchController = TextEditingController();
  //List<String> favoriteHeroes = [];

  final Service _superheroApi = Service();
  List<Map<String, dynamic>> _searchResults = [];

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Error'),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void _searchSuperheroes() async {
    try {
      final query = _searchController.text.trim();
      if (query.isNotEmpty) {
        final results = await _superheroApi.searchSuperhero(query);
        setState(() {
          _searchResults = results;
        });
      }
    } catch (error) {
      _showErrorDialog('No se encontró el superheroe');
    }
  }

  void addToFavorites(Superhero superhero) {
    setState(() {
      superhero.isFavorite = true;
      widget.favoriteHeroes.add(superhero);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Buscar Heroes'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                labelText: 'Heroe',
                suffixIcon: IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () {
                    _searchSuperheroes();
                  },
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _searchResults.length,
              itemBuilder: (context, index) {
                final superhero = _searchResults[index];
                bool isHeroFavorite = widget.favoriteHeroes
                    .any((hero) => hero.name == superhero['name']);

                return ListTile(
                  title: Text(superhero['name']),
                  subtitle: Text(superhero['biography']['full-name']),
                  trailing: IconButton(
                    icon: Icon(
                      isHeroFavorite ? Icons.favorite : Icons.favorite_border,
                      color: isHeroFavorite
                          ? Colors.red
                          : null, // Change the color based on isFavorite flag
                    ),
                    onPressed: () {
                      setState(() {
                        if (isHeroFavorite) {
                          // Remove from favorites
                          widget.favoriteHeroes.removeWhere(
                              (hero) => hero.name == superhero['name']);
                        } else {
                          // Add to favorites
                          widget.favoriteHeroes.add(Superhero(
                            name: superhero['name'],
                            intelligence: superhero['powerstats']
                                ['intelligence'],
                            gender: superhero['appearance']['gender'],
                            image: superhero['image']['url'],
                            isFavorite: true,
                          ));
                        }
                      });
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
