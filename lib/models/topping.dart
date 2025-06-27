class Topping {
  final int id; // Unique identifier for the topping
  final String name;
  final double price;
  final String type; // 'drink' or 'recipe'
  final String selectionType; // 'single' or 'multiple'
  final bool isRequired; // New field for required toppings

  Topping({
    required this.id,
    required this.name,
    required this.price,
    required this.type,
    required this.selectionType,
    this.isRequired = false, // Default to optional
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Topping && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;
}
