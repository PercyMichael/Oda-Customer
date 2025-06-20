import 'package:flutter/material.dart';
import 'package:oda/constants.dart';

class RestaurantCard extends StatelessWidget {
  const RestaurantCard({super.key, required this.restaurant});

  final Map<String, dynamic> restaurant;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          restaurant['imagePath'],
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
              restaurant['price'],
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
    );
  }
}
