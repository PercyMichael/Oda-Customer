import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:oda/constants.dart';
import 'package:oda/models/last_order_item.dart';

class LastOrderCard extends StatelessWidget {
  const LastOrderCard({Key? key, required this.lastOrderItem})
    : super(key: key);

  final LastOrderItem lastOrderItem;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10,
      children: [
        AspectRatio(
          aspectRatio: 1,
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: AssetImage('assets/branding/last_order.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              // Category container (top left)
              Positioned(
                top: 8,
                left: 8,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.green.withOpacity(0.85),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    lastOrderItem.itemName,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              // Heart icon (top right)
              Positioned(
                top: 8,
                right: 8,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.8),
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    icon: const Icon(
                      Icons.favorite_border,
                      color: Colors.red,
                      size: 20,
                    ),
                    onPressed: () {
                      // Add to favourites logic here
                    },
                  ),
                ),
              ),
              // Rating with star (bottom left)
              Positioned(
                bottom: 8,
                left: 8,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.7),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.star, color: Colors.amber, size: 16),
                      const SizedBox(width: 4),
                      Text(
                        lastOrderItem.rating.toStringAsFixed(1),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Row(
          spacing: 5,
          children: [
            CircleAvatar(
              radius: 12,
              backgroundColor: Colors.transparent,
              backgroundImage: AssetImage(lastOrderItem.restaurantLogo),
            ),
            Text(lastOrderItem.restaurantName, style: AppTextStyles.body),
          ],
        ),
        Container(
          padding: const EdgeInsets.all(3),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: AppColors.secondary.withAlpha(60),
          ),
          child: Row(
            spacing: 3,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.delivery_dining, color: AppColors.primary, size: 18),
              Text(
                '${lastOrderItem.deliveryTime} ● ${lastOrderItem.productRating}',
                style: AppTextStyles.body.copyWith(
                  fontSize: 12,
                  color: AppColors.primary,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
