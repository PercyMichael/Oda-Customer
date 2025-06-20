import 'package:flutter/material.dart';
import 'package:oda/constants.dart';
import 'package:get/get.dart';
import 'package:oda/screens/category_item_page.dart';

class CategoryItem extends StatelessWidget {
  final String name;
  final String navigationLink;
  final String imagePath;

  const CategoryItem({
    Key? key,
    required this.name,
    required this.navigationLink,
    required this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => CategoryItemPage(categoryName: name));
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Placeholder for image
          Image.asset(imagePath, width: 65, height: 65),
          SizedBox(height: 8),
          Text(
            name,
            style: AppTextStyles.bodyTitle2.copyWith(
              color: AppColors.textPrimary,
              fontSize: 14,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
