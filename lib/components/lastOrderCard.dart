import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
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
                    color: AppColors.secondary,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Text(
                    lastOrderItem.itemName,
                    style: const TextStyle(
                      color: Colors.white,
                      overflow: TextOverflow.ellipsis,
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
                  height: 35,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.favorite_border, size: 20),
                    onPressed: () {
                      // Add to favourites logic here
                    },
                  ),
                ),
              ),
              // Rating with star (bottom left)
              Positioned(
                bottom: 0,
                left: 0,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.deepOrange,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(
                        MaterialCommunityIcons.star_circle,
                        color: AppColors.white,
                        size: 16,
                      ),
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
                '${lastOrderItem.deliveryFee} ● ${lastOrderItem.deliveryTime}',
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
