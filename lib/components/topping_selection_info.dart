import 'package:flutter/material.dart';
import 'package:oda/constants.dart';
import 'package:oda/models/topping.dart';

class ToppingSelectionInfo extends StatelessWidget {
  final List<Topping> productToppings;
  final String toppingType;

  const ToppingSelectionInfo({
    Key? key,
    required this.productToppings,
    required this.toppingType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final relevantToppings = productToppings.where(
      (t) => t.type == toppingType,
    );
    final isSingleSelection = relevantToppings.every(
      (t) => t.selectionType == 'single',
    );
    final isRequired = relevantToppings.any((t) => t.isRequired);

    return IntrinsicWidth(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 1),
        margin: const EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 254, 255, 190),
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [],
        ),
        child: Row(
          children: [
            // Text(
            //   isSingleSelection ? 'Select one' : 'Select many',
            //   style: AppTextStyles.body.copyWith(color: AppColors.grey),
            // ),
            if (isRequired)
              Text(
                'Choose at least one',
                style: AppTextStyles.body.copyWith(
                  color: AppColors.black,
                  fontSize: 13,
                ),
              )
            else
              Text(
                'Optional',
                style: AppTextStyles.body.copyWith(
                  color: AppColors.black,
                  fontSize: 13,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
