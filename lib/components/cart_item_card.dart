import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:oda/constants.dart';
import 'package:oda/models/cart_item.dart';
import 'package:oda/services/cart_service.dart';
import 'package:oda/components/quantity_control.dart';
import 'package:oda/components/small_quantity_control.dart';

class CartItemCard extends StatelessWidget {
  final CartItem cartItem;
  final CartService cartService;

  const CartItemCard({
    Key? key,
    required this.cartItem,
    required this.cartService,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(bottom: 15),
      color: AppColors.background,
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Row(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            cartItem.product.imagePath,
            width: 80,
            height: 80,
            fit: BoxFit.cover,
          ),
          SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      cartItem.product.name,
                      style: AppTextStyles.bodyTitle,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SmallQuantityControl(
                      initialQuantity: cartItem.quantity,
                      initialPrice: cartItem.product.price,
                      onQuantityChanged: (newQuantity) {
                        // This assumes cartService has a method to update quantity directly.
                        // If not, cart_service.dart will need to be modified.
                        cartService.updateCartItemQuantity(
                          cartItem,
                          newQuantity,
                        );
                      },
                    ),
                  ],
                ),

                if (cartItem.selectedToppings.isNotEmpty)
                  Text(
                    'Toppings: ${cartItem.selectedToppings.values.expand((element) => element).map((e) => e.name).join(', ')}',
                    style: AppTextStyles.bodySmall,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        'Ugx ${NumberFormat("#,###").format(cartItem.totalPrice.round())}',
                        style: AppTextStyles.bodyTitle2,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    if (cartItem.product.discount > 0)
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Ugx ${NumberFormat("#,###").format(cartItem.originalPrice.round())}',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: AppTextStyles.body.copyWith(
                              decoration: TextDecoration.lineThrough,
                              color: AppColors.grey,
                            ),
                          ),
                          SizedBox(width: 10), // Add some spacing
                          Card(
                            color: Colors.deepOrange,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 7.0,
                                vertical: 2.0,
                              ),
                              child: Text(
                                '-${(cartItem.product.discount * 100).toInt()}%',
                                style: AppTextStyles.bodySmall.copyWith(
                                  color: AppColors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                  ],
                ),
                SizedBox(height: 5),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
