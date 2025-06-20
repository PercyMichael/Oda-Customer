import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:oda/constants.dart';

class SearchBox extends StatelessWidget {
  const SearchBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'What do you want to oda today?',
          hintStyle: AppTextStyles.body.copyWith(
            color: AppColors.textSecondary,
          ),
          prefixIcon: Icon(
            Feather.search,
            color: AppColors.secondary,
            size: 30,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.secondary.withOpacity(0.2),
              width: 1.5,
            ),
            borderRadius: BorderRadius.circular(100),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.secondary, width: 2),
            borderRadius: BorderRadius.circular(100),
          ),
        ),
      ),
    );
  }
}
