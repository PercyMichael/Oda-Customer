import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:oda/components/access.dart';
import 'package:oda/components/customBackButton.dart';
import 'package:oda/constants.dart';

class BreakFast extends StatefulWidget {
  const BreakFast({super.key});

  @override
  State<BreakFast> createState() => _BreakFastState();
}

class _BreakFastState extends State<BreakFast> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(20),
              child: Row(children: [CustomBackButton(), Access()]),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
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
                    borderSide: BorderSide(
                      color: AppColors.secondary,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(100),
                  ),
                ),
              ),
            ),
            Center(child: Text('Welcome to the Breakfast Page!')),
          ],
        ),
      ),
    );
  }
}
