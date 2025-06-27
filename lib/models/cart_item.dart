import 'package:oda/models/product.dart';
import 'package:oda/models/topping.dart';

class CartItem {
  final Product product;
  final int quantity;
  final Map<String, List<Topping>> selectedToppings;

  CartItem({
    required this.product,
    required this.quantity,
    required this.selectedToppings,
  });

  double get totalPrice {
    double basePrice = product.price * quantity;
    double toppingsPrice = selectedToppings.values.fold(
      0.0,
      (sum, toppingList) =>
          sum +
          toppingList.fold(0.0, (listSum, topping) => listSum + topping.price),
    );
    double discountedPrice = basePrice * (1 - product.discount);
    return discountedPrice + toppingsPrice;
  }

  double get originalPrice {
    double basePrice = product.price * quantity;
    double toppingsPrice = selectedToppings.values.fold(
      0.0,
      (sum, toppingList) =>
          sum +
          toppingList.fold(0.0, (listSum, topping) => listSum + topping.price),
    );
    return basePrice + toppingsPrice;
  }
}
