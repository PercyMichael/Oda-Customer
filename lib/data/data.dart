import 'package:oda/models/category.dart';
import 'package:oda/models/restaurant.dart';
import 'package:oda/models/last_order_item.dart';
import 'package:oda/models/product.dart';
import 'package:oda/models/topping.dart';

final List<Category> categories = [
  Category(
    name: 'Promos',
    navigationLink: '/promos',
    imagePath: 'assets/branding/menu/Promos.png',
  ),
  Category(
    name: 'Near Me',
    navigationLink: '/near_me',
    imagePath: 'assets/branding/menu/Near Me.png',
  ),
  Category(
    name: 'Open 24Hrs',
    navigationLink: '/open_24hrs',
    imagePath: 'assets/branding/menu/Open 24Hrs.png',
  ),
  Category(
    name: 'Local Food',
    navigationLink: '/local_food',
    imagePath: 'assets/branding/menu/Local Food.png',
  ),
  Category(
    name: 'Pizza',
    navigationLink: '/pizza',
    imagePath: 'assets/branding/menu/Pizza.png',
  ),
  Category(
    name: 'Burgers',
    navigationLink: '/burgers',
    imagePath: 'assets/branding/menu/Burgers.png',
  ),
  Category(
    name: 'Fast Foods',
    navigationLink: '/fast_foods',
    imagePath: 'assets/branding/menu/Fast Foods.png',
  ),
  Category(
    name: 'Halal',
    navigationLink: '/halal',
    imagePath: 'assets/branding/menu/Halal.png',
  ),
];
final List<Restaurant> restaurants = [
  Restaurant(
    name: 'KFC',
    logo: 'assets/branding/restaurants/kfc.png',
    price: 6000,
    rating: 4.7,
    deliveryTime: '10-15',
    deliveryFee: 3200,
    location: 'Kampala, Uganda',
    imageCover: 'assets/branding/restaurant_cover.png',
  ),
  Restaurant(
    name: '72 Restaurant',
    logo: 'assets/branding/restaurants/72.png',
    price: 20000,
    rating: 4.2,
    deliveryTime: '25-35',
    deliveryFee: 2500,
    location: 'Kampala, Uganda',
    imageCover: 'assets/branding/restaurant_cover.png',
  ),
  Restaurant(
    name: 'Caramel',
    logo: 'assets/branding/restaurants/caramel.png',
    price: 22000,
    rating: 4.1,
    deliveryTime: '30-40',
    deliveryFee: 2500,
    location: 'Kampala, Uganda',
    imageCover: 'assets/branding/restaurant_cover.png',
  ),
  Restaurant(
    name: 'Chicken Tonight',
    logo: 'assets/branding/restaurants/chicken2night.png',
    price: 0,
    rating: 3.9,
    deliveryTime: '20-30',
    deliveryFee: 2000,
    location: 'Kampala, Uganda',
    imageCover: 'assets/branding/restaurant_cover.png',
  ),
];

final List<Topping> drinkToppings = [
  Topping(
    id: 101,
    name: 'Coca-Cola',
    price: 2000,
    type: 'drink',
    selectionType: 'single',
    isRequired: true, // Example: Coca-Cola is required
  ),
  Topping(
    id: 102,
    name: 'Sprite',
    price: 2000,
    type: 'drink',
    selectionType: 'single',
    isRequired: false,
  ),
  Topping(
    id: 103,
    name: 'Fanta',
    price: 2000,
    type: 'drink',
    selectionType: 'single',
    isRequired: false,
  ),
];

final List<Topping> recipeToppings = [
  Topping(
    id: 201,
    name: 'Extra Cheese',
    price: 1500,
    type: 'recipe',
    selectionType: 'multiple',
    isRequired: false,
  ),
  Topping(
    id: 202,
    name: 'Bacon Bits',
    price: 2500,
    type: 'recipe',
    selectionType: 'multiple',
    isRequired: false,
  ),
  Topping(
    id: 203,
    name: 'Mushrooms',
    price: 1000,
    type: 'recipe',
    selectionType: 'multiple',
    isRequired: false,
  ),
];

final List<Topping> sauceToppings = [
  Topping(
    id: 301,
    name: 'Ketchup',
    price: 500,
    type: 'sauce',
    selectionType: 'single',
    isRequired: false,
  ),
  Topping(
    id: 302,
    name: 'Mayonnaise',
    price: 500,
    type: 'sauce',
    selectionType: 'single',
    isRequired: false,
  ),
  Topping(
    id: 303,
    name: 'BBQ Sauce',
    price: 700,
    type: 'sauce',
    selectionType: 'single',
    isRequired: false,
  ),
];

final List<Topping> sideToppings = [
  Topping(
    id: 401,
    name: 'Coleslaw',
    price: 1200,
    type: 'side',
    selectionType: 'multiple',
    isRequired: true, // At least one side is required
  ),
  Topping(
    id: 402,
    name: 'Corn on the Cob',
    price: 1500,
    type: 'side',
    selectionType: 'multiple',
    isRequired: true, // At least one side is required
  ),
  Topping(
    id: 403,
    name: 'Mashed Potatoes',
    price: 1000,
    type: 'side',
    selectionType: 'multiple',
    isRequired: true, // At least one side is required
  ),
];

final List<Product> products = [
  Product(
    id: 1,
    name: 'Streetwise 3',
    price: 18000,
    imagePath: 'assets/branding/restaurants/foods/kfc_food.png',
    details:
        'A delicious meal with 3 pieces of chicken, fries, and a drink. Perfect for a quick bite.',
    toppings: [
      ...drinkToppings,
      ...recipeToppings,
      ...sauceToppings,
      ...sideToppings,
    ],
  ),
  Product(
    id: 2,
    name: 'Streetwise 4',
    price: 36000,
    imagePath: 'assets/branding/restaurants/foods/kfc_food.png',
    details:
        'A hearty meal with 4 pieces of chicken, large fries, and two drinks. Great for sharing!',
    toppings: [
      ...drinkToppings,
      ...recipeToppings,
      ...sauceToppings,
      ...sideToppings,
    ],
  ),
  Product(
    id: 3,
    name: 'Fries',
    price: 5000,
    imagePath: 'assets/branding/restaurants/foods/kfc_food.png',
    details: 'Crispy golden fries, perfect as a side or a snack.',
    toppings: [...recipeToppings, ...sauceToppings],
  ),
  Product(
    id: 4,
    name: 'Coke',
    price: 2000,
    imagePath: 'assets/branding/cola.jpg',
    details: 'Refreshing Coca-Cola to quench your thirst.',
    toppings: [...drinkToppings],
  ),
];

final List<LastOrderItem> lastOrders = [
  LastOrderItem(
    itemName: 'Chicken Bucket',
    rating: 4.5,
    restaurantName: 'KFC',
    deliveryTime: '20-30',
    deliveryFee: 1000,
    productRating: 4.2,
    imagePath: 'assets/branding/last_order.png',
    restaurantLogo: 'assets/branding/restaurants/kfc.png',
  ),
  LastOrderItem(
    itemName: 'Margherita Pizza',
    rating: 4.0,
    restaurantName: 'Pizza Hut',
    deliveryTime: '25-35',
    deliveryFee: 2000,
    productRating: 3.8,
    imagePath: 'assets/branding/last_order.png',
    restaurantLogo: 'assets/branding/restaurants/72.png',
  ),
  LastOrderItem(
    itemName: 'Beef Burger',
    rating: 3.8,
    restaurantName: 'Burger King',
    deliveryFee: 1500,
    deliveryTime: '15-25',
    productRating: 4.0,
    imagePath: 'assets/branding/last_order.png',
    restaurantLogo: 'assets/branding/restaurants/chicken2night.png',
  ),

  LastOrderItem(
    itemName: 'Chicken Bucket',
    rating: 4.5,
    restaurantName: 'KFC',
    deliveryTime: '20-30',
    deliveryFee: 34000,
    productRating: 4.2,
    imagePath: 'assets/branding/last_order.png',
    restaurantLogo: 'assets/branding/restaurants/kfc.png',
  ),
];
