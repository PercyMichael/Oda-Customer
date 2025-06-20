import 'package:flutter/material.dart';
import 'package:oda/constants.dart';

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
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Placeholder for image
        Container(
          height: 48,
          width: 48,
          decoration: BoxDecoration(
            color: AppColors.secondary.withOpacity(0.1),
            shape: BoxShape.circle,
          ),
          child: Image.asset(
            imagePath,
            width: 32,
            height: 32,
            color: AppColors.secondary,
          ),
        ),
        SizedBox(height: 8),
        Text(
          name,
          style: AppTextStyles.body.copyWith(color: AppColors.textPrimary),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
