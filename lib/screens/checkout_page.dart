import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:oda/components/customBackButton.dart';
import 'package:oda/constants.dart';
import 'package:oda/services/cart_service.dart';

class CheckoutPage extends StatelessWidget {
  CheckoutPage({Key? key}) : super(key: key);

  final CartService _cartService = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Padding(
          padding: EdgeInsets.only(left: 15),
          child: CustomBackButton(),
        ),
        title: Text('Checkout', style: AppTextStyles.bodyTitle),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Delivery Details', style: AppTextStyles.bodyTitle2),
            SizedBox(height: 10),
            Card(
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.location_on, color: AppColors.primary),
                        SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            'Address: 123 Main St, City, Country',
                            style: AppTextStyles.body,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 5),
                    Row(
                      children: [
                        Icon(Icons.phone, color: AppColors.primary),
                        SizedBox(width: 10),
                        Text('Phone: +123 456 7890', style: AppTextStyles.body),
                      ],
                    ),
                    SizedBox(height: 5),
                    Row(
                      children: [
                        Icon(Icons.person, color: AppColors.primary),
                        SizedBox(width: 10),
                        Text('Name: John Doe', style: AppTextStyles.body),
                      ],
                    ),
                    SizedBox(height: 15),
                    // Placeholder for a small map
                    Container(
                      height: 150,
                      decoration: BoxDecoration(
                        color: AppColors.grey.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text(
                          'Small Map Placeholder',
                          style: AppTextStyles.bodySmall.copyWith(
                            color: AppColors.grey,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),

            Text('Order Summary', style: AppTextStyles.bodyTitle2),
            SizedBox(height: 10),
            Obx(
              () => Card(
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children:
                        _cartService.cartItems.map((item) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Text(
                                    '${item.quantity}x ${item.product.name}',
                                    style: AppTextStyles.body,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                Text(
                                  'Ugx ${NumberFormat("#,###").format(item.totalPrice.round())}',
                                  style: AppTextStyles.body,
                                ),
                              ],
                            ),
                          );
                        }).toList(),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            Obx(
              () => Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Subtotal', style: AppTextStyles.bodyTitle),
                  Text(
                    'Ugx ${NumberFormat("#,###").format(_cartService.totalCartPrice.round())}',
                    style: AppTextStyles.bodyTitle,
                  ),
                ],
              ),
            ),
            SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Delivery Fee', style: AppTextStyles.body),
                Text(
                  'Ugx ${NumberFormat("#,###").format(5000)}',
                  style: AppTextStyles.body,
                ), // Example delivery fee
              ],
            ),
            SizedBox(height: 20),

            Text('Delivery Time', style: AppTextStyles.bodyTitle2),
            SizedBox(height: 10),
            Card(
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  'Estimated Delivery: 30-45 minutes',
                  style: AppTextStyles.body,
                ),
              ),
            ),
            SizedBox(height: 20),

            Text('Payment Details', style: AppTextStyles.bodyTitle2),
            SizedBox(height: 10),
            Card(
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Payment Method: Cash on Delivery',
                      style: AppTextStyles.body,
                    ),
                    SizedBox(height: 5),
                    Text(
                      'Total: Ugx ${NumberFormat("#,###").format((_cartService.totalCartPrice + 5000).round())}',
                      style: AppTextStyles.bodyTitle,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        height: 88,
        color: AppColors.white,
        elevation: 1,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5),
          child: FilledButton(
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
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              backgroundColor: AppColors.primary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: Text('Place Order', style: AppTextStyles.button),
          ),
        ),
      ),
    );
  }
}
