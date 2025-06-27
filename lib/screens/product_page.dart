import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oda/components/customBackButton.dart';
import 'package:oda/constants.dart';
import 'package:oda/components/quantity_control.dart';
import 'package:intl/intl.dart';
import 'package:oda/data/data.dart';
import 'package:oda/models/topping.dart';
import 'package:oda/models/product.dart';
import 'package:oda/components/topping_choice_chip.dart';
import 'package:oda/components/topping_selection_info.dart';
import 'package:oda/services/cart_service.dart';
import 'package:oda/models/cart_item.dart';
import 'package:oda/screens/cart_page.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({Key? key}) : super(key: key);

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  final CartService _cartService = Get.put(CartService());
  int _quantity = 1;
  late double _price;
  final Map<String, List<Topping>> _selectedToppings = {};
  Product? _product; // Make it nullable

  @override
  void initState() {
    super.initState();
    _product = Get.arguments?['product'];
    _price = _product?.price ?? 0.0;
  }

  void _updatePrice(int quantity) {
    setState(() {
      _quantity = quantity;
      double basePrice =
          (_product?.price ?? 0.0) * quantity; // Use _product here
      double toppingsPrice = _selectedToppings.values.fold(
        0.0,
        (sum, toppingList) =>
            sum +
            toppingList.fold(
              0.0,
              (listSum, topping) => listSum + topping.price,
            ),
      );
      _price = basePrice + toppingsPrice;
    });
  }

  void _toggleTopping(Topping topping) {
    setState(() {
      if (topping.selectionType == 'single') {
        // If it's a single selection topping, clear others of the same type
        _selectedToppings[topping.type] = [topping];
      } else {
        // For multiple selection toppings
        if (_selectedToppings.containsKey(topping.type)) {
          if (_selectedToppings[topping.type]!.contains(topping)) {
            _selectedToppings[topping.type]!.remove(topping);
          } else {
            _selectedToppings[topping.type]!.add(topping);
          }
        } else {
          _selectedToppings[topping.type] = [topping];
        }
      }
      _updatePrice(_quantity); // Recalculate price with new toppings
    });
  }

  bool _validateToppings() {
    if (_product == null || _product!.toppings == null) {
      return true; // No toppings or product, so no validation needed
    }

    for (var toppingCategory in _product!.toppings!) {
      if (toppingCategory.isRequired) {
        // Check if any topping of this type is required
        final requiredToppingsOfType =
            _product!.toppings!
                .where((t) => t.type == toppingCategory.type && t.isRequired)
                .toList();

        if (requiredToppingsOfType.isNotEmpty) {
          // If there are required toppings in this category, ensure at least one is selected
          final selectedToppingsInType =
              _selectedToppings[toppingCategory.type] ?? [];
          if (selectedToppingsInType.isEmpty) {
            // If no required topping is selected in this category, validation fails
            return false;
          }
        }
      }
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    final productName = _product?.name ?? '';
    final productImage = _product?.imagePath ?? '';
    final productPrice = _product?.price ?? 0.0;
    final productToppings = _product?.toppings ?? [];

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 242, 255, 255),
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Padding(
          padding: EdgeInsets.only(left: 15),
          child: CustomBackButton(),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Image.asset(
                  productImage ?? 'assets/branding/restaurant_cover.png',
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ],
            ),

            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                spacing: 20,
                children: [
                  //product name and price
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(productName, style: AppTextStyles.bodyTitle),
                      Text(
                        'Ugx ${NumberFormat("#,###").format(productPrice.round())}',
                        style: AppTextStyles.bodyTitle,
                      ),
                    ],
                  ),
                  //end product name and price

                  //product details
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 10,
                    children: [
                      Text('Details', style: AppTextStyles.bodyTitle),
                      Text(
                        _product?.details ??
                            "No details available for this product.",
                        style: AppTextStyles.body,
                      ),
                      SizedBox(height: 20),
                      //toppings
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        spacing: 20,
                        children: [
                          if (productToppings.any(
                            (topping) => topping.type == 'drink',
                          )) ...[
                            Column(
                              spacing: 5,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Drinks', style: AppTextStyles.bodyTitle),
                                ToppingSelectionInfo(
                                  productToppings: productToppings,
                                  toppingType: 'drink',
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children:
                                  productToppings
                                      .where(
                                        (topping) => topping.type == 'drink',
                                      )
                                      .map(
                                        (topping) => Padding(
                                          padding: const EdgeInsets.only(
                                            bottom: 10.0,
                                          ),
                                          child: ToppingChoiceChip(
                                            topping: topping,
                                            isSelected:
                                                _selectedToppings[topping.type]
                                                    ?.contains(topping) ??
                                                false,
                                            onSelected: (selected) {
                                              _toggleTopping(topping);
                                            },
                                          ),
                                        ),
                                      )
                                      .toList(),
                            ),
                          ],
                          if (productToppings.any(
                            (topping) => topping.type == 'recipe',
                          )) ...[
                            Column(
                              spacing: 5,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Recipes', style: AppTextStyles.bodyTitle),
                                IntrinsicWidth(
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: ToppingSelectionInfo(
                                      productToppings: productToppings,
                                      toppingType: 'recipe',
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children:
                                  productToppings
                                      .where(
                                        (topping) => topping.type == 'recipe',
                                      )
                                      .map(
                                        (topping) => Padding(
                                          padding: const EdgeInsets.only(
                                            bottom: 10.0,
                                          ),
                                          child: ToppingChoiceChip(
                                            topping: topping,
                                            isSelected:
                                                _selectedToppings[topping.type]
                                                    ?.contains(topping) ??
                                                false,
                                            onSelected: (selected) {
                                              _toggleTopping(topping);
                                            },
                                          ),
                                        ),
                                      )
                                      .toList(),
                            ),
                          ],
                          if (productToppings.any(
                            (topping) => topping.type == 'sauce',
                          )) ...[
                            Column(
                              spacing: 5,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Sauces', style: AppTextStyles.bodyTitle),
                                IntrinsicWidth(
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: ToppingSelectionInfo(
                                      productToppings: productToppings,
                                      toppingType: 'sauce',
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children:
                                  productToppings
                                      .where(
                                        (topping) => topping.type == 'sauce',
                                      )
                                      .map(
                                        (topping) => Padding(
                                          padding: const EdgeInsets.only(
                                            bottom: 10.0,
                                          ),
                                          child: ToppingChoiceChip(
                                            topping: topping,
                                            isSelected:
                                                _selectedToppings[topping.type]
                                                    ?.contains(topping) ??
                                                false,
                                            onSelected: (selected) {
                                              _toggleTopping(topping);
                                            },
                                          ),
                                        ),
                                      )
                                      .toList(),
                            ),
                          ],
                          if (productToppings.any(
                            (topping) => topping.type == 'side',
                          )) ...[
                            Column(
                              spacing: 5,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Sides', style: AppTextStyles.bodyTitle),
                                IntrinsicWidth(
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: ToppingSelectionInfo(
                                      productToppings: productToppings,
                                      toppingType: 'side',
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children:
                                  productToppings
                                      .where(
                                        (topping) => topping.type == 'side',
                                      )
                                      .map(
                                        (topping) => Padding(
                                          padding: const EdgeInsets.only(
                                            bottom: 10.0,
                                          ),
                                          child: ToppingChoiceChip(
                                            topping: topping,
                                            isSelected:
                                                _selectedToppings[topping.type]
                                                    ?.contains(topping) ??
                                                false,
                                            onSelected: (selected) {
                                              _toggleTopping(topping);
                                            },
                                          ),
                                        ),
                                      )
                                      .toList(),
                            ),
                          ],
                        ],
                      ),
                      //end toppings
                    ],
                  ),
                ],
              ),
            ),

            //end product details
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        height: 88,
        color: AppColors.white,
        elevation: 1,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  QuantityControl(
                    initialQuantity: _quantity,
                    initialPrice: _price, // Use the state's _price
                    onQuantityChanged: _updatePrice,
                  ),
                ],
              ),
              FilledButton(
                onPressed: () {
                  if (_validateToppings()) {
                    if (_product != null) {
                      final cartItem = CartItem(
                        product: _product!,
                        quantity: _quantity,
                        selectedToppings: _selectedToppings,
                      );
                      _cartService.addToCart(cartItem);
                      Get.toNamed(
                        '/cart_page',
                      ); // Navigate to CartPage using named route
                    }
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Please select all required toppings.'),
                        backgroundColor: Colors.red,
                      ),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  backgroundColor: AppColors.secondary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10), // small radius
                  ),
                ),
                child: Text(
                  'Ugx ${NumberFormat("#,###").format(_price.round())}',
                  style: AppTextStyles.button,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
