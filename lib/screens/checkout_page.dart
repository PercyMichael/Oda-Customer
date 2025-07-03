import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:oda/components/customBackButton.dart';
import 'package:oda/components/checkout_footer.dart';
import 'package:oda/components/delivery_details_card.dart';
import 'package:oda/components/delivery_time_card.dart';
import 'package:oda/components/allergies_and_cutlery_section.dart';
import 'package:oda/components/payment_details_card.dart';
import 'package:oda/constants.dart';
import 'package:oda/services/cart_service.dart';
import 'package:oda/components/order_item.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({super.key});

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  final CartService _cartService = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(left: 15),
          child: CustomBackButton(),
        ),
        title: Text('Checkout', style: AppTextStyles.bodyTitle),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        // padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [SizedBox(height: 20)],
              ),
            ),

            Obx(
              () => ExpansionTile(
                initiallyExpanded: true,
                title: Text('Your Oda', style: AppTextStyles.bodyTitle),
                subtitle: Text(
                  '${_cartService.cartItems.fold<int>(0, (sum, item) => sum + item.quantity)} '
                  '${_cartService.cartItems.fold<int>(0, (sum, item) => sum + item.quantity) == 1 ? 'item' : 'items'}',
                  style: AppTextStyles.bodySmall,
                ),
                childrenPadding: const EdgeInsets.symmetric(horizontal: 20.0),
                children: [
                  Column(
                    spacing: 10,
                    children:
                        _cartService.cartItems
                            .map((item) => OrderItem(item: item))
                            .toList(),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 10),
            const AllergiesAndCutlerySection(),
            const SizedBox(height: 20),

            DeliveryDetailsCard(),

            //order for someone
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(
                              MaterialCommunityIcons.gift,
                              color: AppColors.secondary,
                            ),
                            SizedBox(width: 10),
                            Text(
                              'Oda for someone else',
                              style: AppTextStyles.bodyTitle,
                            ),
                          ],
                        ),
                        SizedBox(height: 5),
                        Text(
                          'Add their details to help our courier',
                          style: AppTextStyles.bodySmall.copyWith(
                            color: AppColors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Icon(
                    Icons.keyboard_arrow_right_outlined,
                    color: AppColors.grey,
                    size: 30,
                  ),
                ],
              ),
            ),

            //delivery time
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      DeliveryTimeCard(
                        icon: Icons.delivery_dining,
                        iconColor: AppColors.red,
                        title: '10 - 15 min',
                        subtitle: 'Coming Asap!',
                        backgroundColor: AppColors.red.withOpacity(0.1),
                      ),
                      SizedBox(width: 10),
                      DeliveryTimeCard(
                        icon: Icons.schedule,
                        iconColor: AppColors.secondary,
                        title: 'Schedule Delivery',
                        subtitle: 'We deliver later',
                        backgroundColor: AppColors.secondary.withOpacity(0.1),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            //payment details
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 20,
              ),
              child: PaymentDetailsCard(),
            ),

            //checkout footer
            CheckoutFooter(),
          ],
        ),
      ),
    );
  }
}
