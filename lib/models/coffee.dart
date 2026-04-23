class Coffee {
  final String id;
  final String name;
  final String type;
  final String price;
  final String imagePath;
  final String description;
  final double rating;
  bool isFavorite;

  Coffee({
    required this.id,
    required this.name,
    required this.type,
    required this.price,
    required this.imagePath,
    required this.description,
    required this.rating,
    this.isFavorite = false,
  });
}
