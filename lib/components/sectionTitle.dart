import 'package:flutter/material.dart';
import 'package:oda/constants.dart';

class SectionTitle extends StatelessWidget {
  final String title;
  const SectionTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: AppTextStyles.bodyTitle),
          Text('See all', style: AppTextStyles.body),
        ],
      ),
    );
  }
}
