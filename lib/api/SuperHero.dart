class Superhero {
  final String name;
  final String intelligence;
  final String gender;
  final String image;

  bool isFavorite;

  Superhero({
    required this.name,
    required this.intelligence,
    required this.gender,
    required this.image,
    this.isFavorite = false,
  });
}
