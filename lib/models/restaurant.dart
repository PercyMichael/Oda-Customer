class Restaurant {
  final String name;
  final String imagePath;
  final String price;

  Restaurant({
    required this.name,
    required this.imagePath,
    required this.price,
  });

  Map<String, dynamic> toJson() {
    return {'name': name, 'imagePath': imagePath, 'price': price};
  }
}
