import 'package:flutter/material.dart';
import 'package:oda/constants.dart';

class Button extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color? color;
  final Color? textColor;
  final double? elevation;
  final double borderWidth; // New: Border width (default: 0)
  final Color borderColor; // New: Border color (default: transparent)
  final Widget? icon;

  const Button({
    super.key,
    required this.text,
    required this.onPressed,
    this.color = Colors.black, // Default to black
    this.textColor = Colors.white, // Default text color to white
    this.elevation = 2.0, // Default elevation to 2.0
    this.borderWidth = 0.0, // Default no border
    this.borderColor = Colors.transparent,
    this.icon, // Optional icon or image
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity, // Makes the button full width
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: color ?? AppColors.primary,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: BorderSide(
              width: borderWidth, // Dynamically set the border width
              color:
                  AppColors.textSecondary, // Keep the border color transparent
            ),
          ),
          elevation: elevation, // Set elevation dynamically
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null) ...[
              icon!, // Show the icon if it's passed
              const SizedBox(width: 20), // Space between icon and text
            ],
            Text(
              text,
              style: AppTextStyles.button.copyWith(
                color: textColor ?? Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
    ;
  }
}
