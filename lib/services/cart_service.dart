import 'package:get/get.dart';
import 'package:oda/models/cart_item.dart';
import 'package:oda/models/topping.dart';

class CartService extends GetxController {
  CartService() {
    print('CartService instance created/retrieved');
  }
  final RxList<CartItem> _cartItems = <CartItem>[].obs;

  List<CartItem> get cartItems => _cartItems.toList();

  double get totalCartPrice =>
      _cartItems.fold(0.0, (sum, item) => sum + item.totalPrice);

  void addToCart(CartItem item) {
    print('Adding to cart: ${item.product.name}, Quantity: ${item.quantity}');
    // Check if the product with the exact same toppings already exists in the cart
    final existingItemIndex = _cartItems.indexWhere(
      (cartItem) =>
          cartItem.product.id == item.product.id &&
          _areToppingsEqual(cartItem.selectedToppings, item.selectedToppings),
    );

    if (existingItemIndex != -1) {
      // If it exists, update the quantity
      _cartItems[existingItemIndex] = CartItem(
        product: item.product,
        quantity: _cartItems[existingItemIndex].quantity + item.quantity,
        selectedToppings: item.selectedToppings,
      );
      print('Updated existing item. Current cart items: ${_cartItems.length}');
    } else {
      // Otherwise, add as a new item
      _cartItems.add(item);
      print('Added new item. Current cart items: ${_cartItems.length}');
    }
  }

  void removeFromCart(CartItem item) {
    print('Removing from cart: ${item.product.name}');
    _cartItems.remove(item);
    print('Current cart items: ${_cartItems.length}');
  }

  void clearCart() {
    print('Clearing cart');
    _cartItems.clear();
    print('Current cart items: ${_cartItems.length}');
  }

  void updateCartItemQuantity(CartItem item, int newQuantity) {
    print('Updating quantity for ${item.product.name} to $newQuantity');
    final index = _cartItems.indexOf(item);
    if (index != -1) {
      if (newQuantity > 0) {
        _cartItems[index] = CartItem(
          product: item.product,
          quantity: newQuantity,
          selectedToppings: item.selectedToppings,
        );
        print('Quantity updated. Current cart items: ${_cartItems.length}');
      } else {
        _cartItems.removeAt(index);
        print(
          'Item removed due to zero quantity. Current cart items: ${_cartItems.length}',
        );
      }
    }
  }

  bool _areToppingsEqual(
    Map<String, List<Topping>> toppings1,
    Map<String, List<Topping>> toppings2,
  ) {
    if (toppings1.length != toppings2.length) {
      return false;
    }

    for (final type in toppings1.keys) {
      final list1 = toppings1[type] ?? [];
      final list2 = toppings2[type] ?? [];

      if (list1.length != list2.length) {
        return false;
      }

      // Sort lists to ensure consistent comparison
      final sortedList1 = list1.map((t) => t.id).toList()..sort();
      final sortedList2 = list2.map((t) => t.id).toList()..sort();

      for (int i = 0; i < sortedList1.length; i++) {
        if (sortedList1[i] != sortedList2[i]) {
          return false;
        }
      }
    }
    return true;
  }
}
