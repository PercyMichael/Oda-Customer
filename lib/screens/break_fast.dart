import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:oda/components/CategoryItem.dart';
import 'package:oda/components/access.dart';
import 'package:oda/components/customBackButton.dart';
import 'package:oda/constants.dart';

class BreakFast extends StatefulWidget {
  const BreakFast({super.key});

  @override
  State<BreakFast> createState() => _BreakFastState();
}

class _BreakFastState extends State<BreakFast> {
  // Data structure for categories
  final List<Map<String, dynamic>> categories = [
    {
      'name': 'Category 1',
      'navigationLink': '/category1',
      'imagePath': 'assets/branding/food_plate.png',
    },
    {
      'name': 'Category 2',
      'navigationLink': '/category2',
      'imagePath': 'assets/branding/food_plate.png',
    },
    {
      'name': 'Category 3',
      'navigationLink': '/category3',
      'imagePath': 'assets/branding/food_plate.png',
    },
    {
      'name': 'Category 4',
      'navigationLink': '/category4',
      'imagePath': 'assets/branding/food_plate.png',
    },
    {
      'name': 'Category 5',
      'navigationLink': '/category5',
      'imagePath': 'assets/branding/food_plate.png',
    },
    {
      'name': 'Category 6',
      'navigationLink': '/category6',
      'imagePath': 'assets/branding/food_plate.png',
    },
    {
      'name': 'Category 7',
      'navigationLink': '/category7',
      'imagePath': 'assets/branding/food_plate.png',
    },
    {
      'name': 'Category 8',
      'navigationLink': '/category8',
      'imagePath': 'assets/branding/food_plate.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [CustomBackButton(), Access()],
              ),
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

            //Category Grid
            Expanded(
              child: GridView.builder(
                padding: EdgeInsets.symmetric(horizontal: 20),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: 0.8, // More vertical space for image+text
                ),
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  final category = categories[index];
                  return CategoryItem(
                    name: category['name'],
                    navigationLink: category['navigationLink'],
                    imagePath: category['imagePath'],
                  );
                },
              ),
            ),

            //End of Category Grid
            SizedBox(height: 20),
            Center(child: Text('Welcome to the Breakfast Page!')),
          ],
        ),
      ),
    );
  }
}
