import 'package:flutter/material.dart';
import 'package:oda/constants.dart';

class RestaurantStats extends StatelessWidget {
  const RestaurantStats({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      spacing: 20,
      children: [
        Row(
          spacing: 8,
          children: [
            CircleAvatar(
              backgroundColor: Colors.deepOrange,
              foregroundColor: AppColors.white,
              radius: 20,
              child: Icon(Icons.star_rounded, size: 30),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '4.7',
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
          spacing: 8,
          children: [
            CircleAvatar(
              backgroundColor: AppColors.primary,
              foregroundColor: AppColors.white,
              radius: 20,
              child: Icon(Icons.delivery_dining, size: 30),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'UGX 3,200',
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
          spacing: 8,
          children: [
            CircleAvatar(
              backgroundColor: AppColors.secondary,
              foregroundColor: AppColors.white,
              radius: 20,
              child: Icon(Icons.access_time_rounded, size: 30),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "10 -15'",
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
