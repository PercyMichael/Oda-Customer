import 'package:oda/models/topping.dart';

class Product {
  final int id; // Unique identifier for the product
  final String name;
  final double price;
  final String imagePath;
  final String? details; // New field for product details
  final List<Topping>? toppings;
  final double discount; // New field for product discount

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.imagePath,
    this.details, // Make it optional
    this.toppings,
    this.discount = 0.0, // Default to no discount
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Product && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;
}
