import 'package:flutter/material.dart';
import 'package:oda/constants.dart';

class QuantityControl extends StatefulWidget {
  final int initialQuantity;
  final double initialPrice;
  final Function(int) onQuantityChanged;
  final double iconSize;
  final EdgeInsetsGeometry buttonPadding;
  final Size buttonMinSize;
  final double textFontSize;
  final double textMinWidth;
  final double textMaxWidth;

  const QuantityControl({
    Key? key,
    required this.initialQuantity,
    required this.initialPrice,
    required this.onQuantityChanged,
    this.iconSize = 20,
    this.buttonPadding = const EdgeInsets.all(6),
    this.buttonMinSize = const Size(30, 30),
    this.textFontSize = 16,
    this.textMinWidth = 15.0,
    this.textMaxWidth = 30.0,
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
          icon: Icon(
            Icons.remove,
            color: AppColors.secondary,
            size: widget.iconSize,
          ),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.grey[300]),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            ),
            padding: MaterialStateProperty.all(widget.buttonPadding),
            minimumSize: MaterialStateProperty.all(widget.buttonMinSize),
          ),
        ),
        SizedBox(width: widget.buttonPadding.horizontal / 2),
        Flexible(
          child: Text(
            '$_quantity',
            style: AppTextStyles.bodyTitle.copyWith(
              fontSize: widget.textFontSize,
            ),
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        SizedBox(width: widget.buttonPadding.horizontal / 2),
        IconButton(
          onPressed: () => _updateQuantity(1),
          icon: Icon(Icons.add, color: AppColors.white, size: widget.iconSize),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(AppColors.secondary),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            ),
            padding: MaterialStateProperty.all(widget.buttonPadding),
            minimumSize: MaterialStateProperty.all(widget.buttonMinSize),
          ),
        ),
      ],
    );
  }
}
