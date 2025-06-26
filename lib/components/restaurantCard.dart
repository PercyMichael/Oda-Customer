import 'package:flutter/material.dart';
import 'package:oda/constants.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';
import 'package:oda/screens/restaurant_page.dart';
import 'package:oda/models/restaurant.dart';

class RestaurantCard extends StatelessWidget {
  const RestaurantCard({super.key, required this.restaurant});

  final Restaurant restaurant;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => RestaurantPage(restaurant: restaurant));
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            restaurant.logo,
            width: 60,
            height: 60,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.delivery_dining, size: 16),
              SizedBox(width: 4),
              Text(
                'Ugx ${NumberFormat("#,###").format(restaurant.price)}',
                style: AppTextStyles.body.copyWith(
                  fontSize: 12,
                  color: AppColors.primary,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
