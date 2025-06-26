import 'package:flutter/material.dart';
import 'package:oda/constants.dart';

class QuantityControl extends StatefulWidget {
  final int initialQuantity;
  final double initialPrice;
  final Function(int) onQuantityChanged;

  const QuantityControl({
    Key? key,
    required this.initialQuantity,
    required this.initialPrice,
    required this.onQuantityChanged,
  }) : super(key: key);

  @override
  State<QuantityControl> createState() => _QuantityControlState();
}

class _QuantityControlState extends State<QuantityControl> {
  late int _quantity;
  late double _price;

  @override
  void initState() {
    super.initState();
    _quantity = widget.initialQuantity;
    _price = widget.initialPrice;
  }

  void _updateQuantity(int delta) {
    setState(() {
      _quantity += delta;
      _price = widget.initialPrice * _quantity;
      widget.onQuantityChanged(_quantity);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          onPressed: _quantity > 1 ? () => _updateQuantity(-1) : null,
          icon: const Icon(Icons.remove, color: AppColors.secondary),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.grey[300]),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            ),
            padding: MaterialStateProperty.all(const EdgeInsets.all(8)),
            minimumSize: MaterialStateProperty.all(const Size(35, 35)),
          ),
        ),
        const SizedBox(width: 10),
        Text('$_quantity', style: AppTextStyles.bodyTitle),
        const SizedBox(width: 10),
        IconButton(
          onPressed: () => _updateQuantity(1),
          icon: const Icon(Icons.add, color: AppColors.white),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(AppColors.secondary),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            ),
            padding: MaterialStateProperty.all(const EdgeInsets.all(8)),
            minimumSize: MaterialStateProperty.all(const Size(35, 35)),
          ),
        ),
      ],
    );
  }
}
