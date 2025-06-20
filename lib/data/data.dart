import 'package:oda/models/category.dart';
import 'package:oda/models/restaurant.dart';
import 'package:oda/models/last_order_item.dart';

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
    imagePath: 'assets/branding/restaurants/kfc.png',
    price: 'Ugx 6,000',
  ),
  Restaurant(
    name: 'Pizza Hut',
    imagePath: 'assets/branding/restaurants/72.png',
    price: 'Ugx 20,000',
  ),
  Restaurant(
    name: 'Domino\'s Pizza',
    imagePath: 'assets/branding/restaurants/caramel.png',
    price: 'Ugx 22,000',
  ),
  Restaurant(
    name: 'Burger King',
    imagePath: 'assets/branding/restaurants/chicken2night.png',
    price: 'Free',
  ),
];

final List<LastOrderItem> lastOrders = [
  LastOrderItem(
    itemName: 'Chicken Bucket',
    rating: 4.5,
    restaurantName: 'KFC',
    deliveryTime: '20-30 min',
    productRating: 4.2,
    imagePath: 'assets/branding/last_order.png',
    restaurantLogo: 'assets/branding/restaurants/kfc.png',
  ),
  LastOrderItem(
    itemName: 'Margherita Pizza',
    rating: 4.0,
    restaurantName: 'Pizza Hut',
    deliveryTime: '25-35 min',
    productRating: 3.8,
    imagePath: 'assets/branding/last_order.png',
    restaurantLogo: 'assets/branding/restaurants/72.png',
  ),
  LastOrderItem(
    itemName: 'Beef Burger',
    rating: 3.8,
    restaurantName: 'Burger King',
    deliveryTime: '15-25 min',
    productRating: 4.0,
    imagePath: 'assets/branding/last_order.png',
    restaurantLogo: 'assets/branding/restaurants/chicken2night.png',
  ),
];
