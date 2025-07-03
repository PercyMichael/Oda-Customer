import 'package:flutter/material.dart';
import 'package:oda/components/quantity_control.dart';

class SmallQuantityControl extends StatelessWidget {
  final int initialQuantity;
  final double initialPrice;
  final Function(int) onQuantityChanged;

  const SmallQuantityControl({
    super.key,
    required this.initialQuantity,
    required this.initialPrice,
    required this.onQuantityChanged,
  });

  @override
  Widget build(BuildContext context) {
    return QuantityControl(
      initialQuantity: initialQuantity,
      initialPrice: initialPrice,
      onQuantityChanged: onQuantityChanged,
      iconSize: 18,
      buttonPadding: const EdgeInsets.all(0),
      buttonMinSize: const Size(23, 23),
      textFontSize: 14,
      textMinWidth: 8.0,
      textMaxWidth: 14.0,
    );
  }
}
