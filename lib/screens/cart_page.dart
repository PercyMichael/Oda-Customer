import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:oda/components/customBackButton.dart';
import 'package:oda/constants.dart';
import 'package:oda/services/cart_service.dart';

class CartPage extends StatelessWidget {
  CartPage({Key? key}) : super(key: key);

  final CartService _cartService = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 242, 255, 255),
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
                    return Card(
                      margin: EdgeInsets.only(bottom: 15),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Image.asset(
                                cartItem.product.imagePath,
                                width: 80,
                                height: 80,
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(width: 15),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    cartItem.product.name,
                                    style: AppTextStyles.bodyTitle,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    'Ugx ${NumberFormat("#,###").format(cartItem.totalPrice.round())}',
                                    style: AppTextStyles.body,
                                  ),
                                  SizedBox(height: 5),
                                  if (cartItem.selectedToppings.isNotEmpty)
                                    Text(
                                      'Toppings: ${cartItem.selectedToppings.values.expand((element) => element).map((e) => e.name).join(', ')}',
                                      style: AppTextStyles.bodySmall,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  SizedBox(height: 10),
                                  Row(
                                    children: [
                                      IconButton(
                                        icon: Icon(Icons.remove_circle_outline),
                                        onPressed: () {
                                          _cartService.decreaseQuantity(
                                            cartItem,
                                          );
                                        },
                                      ),
                                      Text(
                                        '${cartItem.quantity}',
                                        style: AppTextStyles.body,
                                      ),
                                      IconButton(
                                        icon: Icon(Icons.add_circle_outline),
                                        onPressed: () {
                                          _cartService.increaseQuantity(
                                            cartItem,
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
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
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total: Ugx ${NumberFormat("#,###").format(_cartService.totalCartPrice.round())}',
                  style: AppTextStyles.bodyTitle,
                ),
                FilledButton(
                  onPressed:
                      _cartService.cartItems.isEmpty
                          ? null
                          : () {
                            // Implement checkout logic here
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Proceeding to checkout!'),
                                backgroundColor: Colors.blue,
                              ),
                            );
                          },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                    backgroundColor: AppColors.secondary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text('Checkout', style: AppTextStyles.button),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
