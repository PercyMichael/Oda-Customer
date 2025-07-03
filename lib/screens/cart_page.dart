import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:oda/components/customBackButton.dart';
import 'package:oda/constants.dart';
import 'package:oda/services/cart_service.dart';
import 'package:oda/components/cart_item_card.dart';
import 'package:oda/components/custom_filled_button.dart';

class CartPage extends StatelessWidget {
  CartPage({super.key});

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
        title: Text('Your Cart', style: AppTextStyles.bodyTitle),
        centerTitle: true,
      ),
      body: Obx(
        () =>
            _cartService.cartItems.isEmpty
                ? Center(
                  child: Text(
                    'Your cart is empty!',
                    style: AppTextStyles.bodyTitle,
                  ),
                )
                : ListView.builder(
                  padding: EdgeInsets.all(20),
                  itemCount: _cartService.cartItems.length,
                  itemBuilder: (context, index) {
                    final cartItem = _cartService.cartItems[index];
                    return CartItemCard(
                      cartItem: cartItem,
                      cartService: _cartService,
                    );
                  },
                ),
      ),
      bottomNavigationBar: Obx(
        () => BottomAppBar(
          height: 88,
          color: AppColors.white,
          elevation: 1,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
            child: CustomFilledButton(
              text:
                  'Checkout Ugx ${NumberFormat("#,###").format(_cartService.totalCartPrice.round())}',
              onPressed:
                  _cartService.cartItems.isEmpty
                      ? null
                      : () {
                        Get.toNamed('/checkout_page');
                      },
            ),
          ),
        ),
      ),
    );
  }
}
