import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:oda/constants.dart';
import 'package:oda/models/product.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed('/product_page', arguments: {'product': product});
      },
      child: Column(
        spacing: 10,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 180,
            decoration: BoxDecoration(
              // border: Border.all(width: 1),
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: AssetImage(product.imagePath),
                fit: BoxFit.cover,
              ),
            ),
            child: Stack(
              children: [
                Positioned(
                  left: 5,
                  top: 5,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 1),
                    decoration: BoxDecoration(
                      color: AppColors.secondary,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      product.name,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyles.body.copyWith(
                        fontSize: 12,
                        color: AppColors.white,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  right: 5,
                  top: 5,
                  child: CircleAvatar(
                    radius: 12,
                    backgroundColor: AppColors.secondary,
                    foregroundColor: AppColors.white,
                    child: Icon(Icons.add),
                  ),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (product.discount > 0) ...[
                Text(
                  'Ugx ${NumberFormat("#,###").format(product.price)}',
                  style: AppTextStyles.bodySmall.copyWith(
                    decoration: TextDecoration.lineThrough,
                    color: AppColors.grey,
                  ),
                ),
                Text(
                  '${(product.discount * 100).toInt()}% OFF',
                  style: AppTextStyles.bodySmall.copyWith(
                    color: AppColors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
              Text(
                'Ugx ${NumberFormat("#,###").format((product.price * (1 - product.discount)).round())}',
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
