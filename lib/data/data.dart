import 'package:oda/models/category.dart';
import 'package:oda/models/restaurant.dart';
import 'package:oda/models/last_order_item.dart';
import 'package:oda/models/product.dart';

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

final List<Product> products = [
  Product(
    name: 'Streetwise 3',
    price: 18000,
    imagePath: 'assets/branding/restaurants/foods/kfc_food.png',
  ),
  Product(
    name: 'Streetwise 4',
    price: 36000,
    imagePath: 'assets/branding/restaurants/foods/kfc_food.png',
  ),
  Product(
    name: 'Fries',
    price: 5000,
    imagePath: 'assets/branding/restaurants/foods/kfc_food.png',
  ),
  Product(
    name: 'Coke',
    price: 2000,
    imagePath: 'assets/branding/restaurants/foods/kfc_food.png',
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
