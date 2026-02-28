class Piece {
  final String id;
  final String title;
  final String description;
  final String category;
  final String imagePath;
  final String dimensions;
  final double price;
  final List<String> tags;

  const Piece({
    required this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.imagePath,
    required this.dimensions,
    required this.price,
    required this.tags,
  });
}
