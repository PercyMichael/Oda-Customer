import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:oda/constants.dart';
import 'package:oda/models/topping.dart';

class ToppingChoiceChip extends StatelessWidget {
  final Topping topping;
  final bool isSelected;
  final ValueChanged<bool> onSelected;

  const ToppingChoiceChip({
    Key? key,
    required this.topping,
    required this.isSelected,
    required this.onSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onSelected(!isSelected),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 12),

        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              topping.name,
              style: AppTextStyles.body.copyWith(color: AppColors.black),
            ),

            Row(
              children: [
                Text(
                  '+Ugx ${NumberFormat("#,###").format(topping.price.round())}',
                  style: AppTextStyles.bodyTitle2.copyWith(
                    color: AppColors.black,
                  ),
                ),
                SizedBox(width: 10),
                Icon(
                  Icons.add_circle,
                  size: 35,
                  color: isSelected ? AppColors.secondary : Colors.grey[400],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
