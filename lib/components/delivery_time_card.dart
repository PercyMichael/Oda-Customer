import 'package:flutter/material.dart';
import 'package:oda/constants.dart';

class DeliveryTimeCard extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String title;
  final String subtitle;
  final Color backgroundColor;

  const DeliveryTimeCard({
    super.key,
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.subtitle,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        color: backgroundColor,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(icon, color: iconColor),
                  SizedBox(width: 5),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: AppTextStyles.bodySmall.copyWith(
                          color: AppColors.black,
                          fontSize: 13,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(subtitle, style: AppTextStyles.bodySmall),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
