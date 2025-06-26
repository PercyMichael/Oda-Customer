import 'package:flutter/material.dart';
import 'package:oda/constants.dart';
import 'package:oda/models/restaurant.dart';
import 'package:intl/intl.dart';

class RestaurantStats extends StatelessWidget {
  final Restaurant restaurant;
  const RestaurantStats({super.key, required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            CircleAvatar(
              backgroundColor: Colors.deepOrange,
              foregroundColor: AppColors.white,
              radius: 20,
              child: Icon(Icons.star_rounded, size: 30),
            ),
            SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  restaurant.rating.toString(),
                  style: AppTextStyles.bodyTitle.copyWith(fontSize: 14),
                ),
                Text(
                  'Rating',
                  style: AppTextStyles.body.copyWith(fontSize: 12),
                ),
              ],
            ),
          ],
        ),
        Row(
          children: [
            CircleAvatar(
              backgroundColor: AppColors.primary,
              foregroundColor: AppColors.white,
              radius: 20,
              child: Icon(Icons.delivery_dining, size: 30),
            ),
            SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Ugx ${NumberFormat("#,###").format(restaurant.deliveryFee)}',
                  style: AppTextStyles.bodyTitle.copyWith(fontSize: 14),
                ),
                Text(
                  'Avg. Fee',
                  style: AppTextStyles.body.copyWith(fontSize: 12),
                ),
              ],
            ),
          ],
        ),
        Row(
          children: [
            CircleAvatar(
              backgroundColor: AppColors.secondary,
              foregroundColor: AppColors.white,
              radius: 20,
              child: Icon(Icons.access_time_rounded, size: 30),
            ),
            SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${restaurant.deliveryTime.toString()}'",
                  style: AppTextStyles.bodyTitle.copyWith(fontSize: 14),
                ),
                Text(
                  'Avg. Time',
                  style: AppTextStyles.body.copyWith(fontSize: 12),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
