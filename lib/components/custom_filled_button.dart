import 'package:flutter/material.dart';
import 'package:oda/constants.dart';

class CustomFilledButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final Color? backgroundColor;

  const CustomFilledButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: FilledButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
          backgroundColor: backgroundColor ?? AppColors.secondary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Text(text, style: AppTextStyles.button),
      ),
    );
  }
}
