import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oda/constants.dart';
import 'package:oda/components/quantity_control.dart';
import 'package:intl/intl.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({Key? key}) : super(key: key);

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  int _quantity = 1;
  late double _price;

  @override
  void initState() {
    super.initState();
    _price = Get.arguments['price'] ?? 10.0;
  }

  void _updatePrice(int quantity) {
    setState(() {
      _quantity = quantity;
      _price = (Get.arguments['price'] ?? 10.0) * quantity;
    });
  }

  @override
  Widget build(BuildContext context) {
    final productName = Get.arguments['productName'];
    final productImage = Get.arguments['productImage'];

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 237, 252, 252),
      extendBodyBehindAppBar: true,
      appBar: AppBar(backgroundColor: Colors.transparent, elevation: 0),
      body: Stack(
        children: [
          Image.asset(
            productImage ?? 'assets/branding/restaurant_cover.png',
            height: 200,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ],
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
                    initialPrice: Get.arguments['price'] ?? 10.0,
                    onQuantityChanged: _updatePrice,
                  ),
                ],
              ),
              FilledButton(
                onPressed: () {
                  // Add to cart functionality
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
