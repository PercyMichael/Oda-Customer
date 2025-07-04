import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oda/constants.dart';
import 'package:oda/screens/auth/login.dart';
import 'package:oda/screens/auth/onboard.dart';
import 'package:oda/screens/break_fast.dart';
import 'package:oda/screens/home.dart';
import 'package:oda/screens/product_page.dart';
import 'package:oda/screens/restaurant_page.dart';
import 'package:oda/models/restaurant.dart';
import 'package:oda/data/data.dart';
import 'package:oda/screens/cart_page.dart';
import 'package:oda/screens/checkout_page.dart';

import 'package:oda/services/cart_service.dart';

void main() {
  Get.put(CartService()); // Register CartService as a persistent dependency
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Oda',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        appBarTheme: AppBarTheme(backgroundColor: AppColors.white),
        scaffoldBackgroundColor: AppColors.white,
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.white),
      ),

      home: const Login(),
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => Login()),
        GetPage(name: '/onboard', page: () => onBoard()),
        GetPage(name: '/home', page: () => HomeScreen()),

        //Food Categories
        GetPage(name: '/break_fast', page: () => BreakFast()),

        //restaurant details
        GetPage(
          name: '/restaurant_page',
          page: () => RestaurantPage(restaurant: Get.arguments as Restaurant),
        ),

        //product page
        GetPage(
          name: '/product_page',
          page: () => ProductPage(),
          arguments: {
            'product': products[0],
          }, // Pass a default product for testing
        ),
        GetPage(name: '/cart_page', page: () => CartPage()),
        GetPage(name: '/checkout_page', page: () => CheckoutPage()),
      ],
    );
  }
}
