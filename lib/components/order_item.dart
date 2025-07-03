import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:oda/constants.dart';
import 'package:oda/models/cart_item.dart';

class OrderItem extends StatelessWidget {
  final CartItem item;

  const OrderItem({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Column(
        children: [
          //ITEM DESCRIPTIONS
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  '${item.quantity}x ${item.product.name}',
                  style: AppTextStyles.bodyTitle2,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Text(
                'Ugx ${NumberFormat("#,###").format(item.totalPrice.round())}',
                style: AppTextStyles.body.copyWith(color: Colors.black),
              ),
            ],
          ),

          //Discounts
          if (item.product.discount > 0) ...[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Card(
                  color: Colors.deepOrange,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 7.0,
                      vertical: 2.0,
                    ),
                    child: Text(
                      'Promo',
                      style: AppTextStyles.bodySmall.copyWith(
                        color: AppColors.white,
                      ),
                    ),
                  ),
                ),

                Text(
                  '-${(item.product.discount * 100).toInt()}%',
                  style: AppTextStyles.bodySmall.copyWith(
                    color: AppColors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Ugx ${NumberFormat("#,###").format(item.originalPrice.round())}',
                  style: AppTextStyles.bodySmall.copyWith(
                    decoration: TextDecoration.lineThrough,
                    color: AppColors.grey,
                  ),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }
}
