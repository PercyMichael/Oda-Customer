import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:oda/constants.dart';
import 'package:oda/services/cart_service.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:oda/components/custom_filled_button.dart';

class CheckoutFooter extends StatelessWidget {
  CheckoutFooter({super.key});

  final CartService _cartService = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
      decoration: BoxDecoration(
        color: AppColors.secondary.withOpacity(0.1),
        border: Border(
          top: BorderSide(
            color: Colors.grey.shade300, // You can customize the color
            width: 1.0, // You can customize the width
          ),
        ),
      ),
      child: Column(
        spacing: 15,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Summary', style: AppTextStyles.bodyTitle),
          SizedBox(height: 2),
          Obx(
            () => Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Items', style: AppTextStyles.body),
                Text(
                  'Ugx ${NumberFormat("#,###").format(_cartService.totalCartPrice.round())}',
                  style: AppTextStyles.body.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Delivery', style: AppTextStyles.body),
              Text(
                'Ugx ${NumberFormat("#,###").format(1500)}',
                style: AppTextStyles.body.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Service Charge', style: AppTextStyles.body),
              Text(
                'Ugx ${NumberFormat("#,###").format(0)}',
                style: AppTextStyles.body.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Obx(
            () => Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Promo Discount', style: AppTextStyles.body),
                Text(
                  '-Ugx ${NumberFormat("#,###").format(_cartService.totalDiscountAmount.round())}',
                  style: AppTextStyles.body.copyWith(
                    color: AppColors.secondary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          //divider
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: DottedLine(
              dashColor: Colors.grey.shade400,
              dashLength: 8.0,
              dashGapLength: 4.0,
              lineThickness: 1.0,
            ),
          ),
          Obx(
            () => Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Total Amount', style: AppTextStyles.bodyTitle),
                Text(
                  'Ugx ${NumberFormat("#,###").format((_cartService.totalCartPrice + 1500 - _cartService.totalDiscountAmount).round())}',
                  style: AppTextStyles.bodyTitle,
                ),
              ],
            ),
          ),

          //pacr order button
          SizedBox(height: 5),
          CustomFilledButton(
            text: 'Pat to ODA',
            onPressed: () {
              // Implement final order placement logic here
              _cartService.clearCart(); // Clear cart after successful order
              Get.snackbar(
                'Order Placed!',
                'Your order has been placed successfully.',
                snackPosition: SnackPosition.BOTTOM,
                backgroundColor: Colors.green,
                colorText: Colors.white,
              );
              Get.offAllNamed(
                '/home',
              ); // Navigate back to home or order confirmation
            },
          ),
        ],
      ),
    );
  }
}
