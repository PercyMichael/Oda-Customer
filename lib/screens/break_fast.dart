import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:oda/components/categoryItem.dart';
import 'package:oda/components/access.dart';
import 'package:oda/components/customBackButton.dart';
import 'package:oda/components/searchBox.dart';
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
      'name': 'Promos',
      'navigationLink': '/promos',
      'imagePath': 'assets/branding/menu/Promos.png',
    },
    {
      'name': 'Near Me',
      'navigationLink': '/near_me',
      'imagePath': 'assets/branding/menu/Near Me.png',
    },
    {
      'name': 'Open 24Hrs',
      'navigationLink': '/open_24hrs',
      'imagePath': 'assets/branding/menu/Open 24Hrs.png',
    },
    {
      'name': 'Local Food',
      'navigationLink': '/local_food',
      'imagePath': 'assets/branding/menu/Local Food.png',
    },
    {
      'name': 'Pizza',
      'navigationLink': '/pizza',
      'imagePath': 'assets/branding/menu/Pizza.png',
    },
    {
      'name': 'Burgers',
      'navigationLink': '/burgers',
      'imagePath': 'assets/branding/menu/Burgers.png',
    },
    {
      'name': 'Fast Foods',
      'navigationLink': '/fast_foods',
      'imagePath': 'assets/branding/menu/Fast Foods.png',
    },
    {
      'name': 'Halal',
      'navigationLink': '/halal',
      'imagePath': 'assets/branding/menu/Halal.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Header with back button and access widget
            Padding(
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [CustomBackButton(), Access()],
              ),
            ),
            // Search TextField
            SearchBox(),
            //Category Grid
            Expanded(
              child: GridView.builder(
                padding: EdgeInsets.symmetric(horizontal: 10),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  mainAxisSpacing: 5,
                  crossAxisSpacing: 0,
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
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Restaurant', style: AppTextStyles.bodyTitle),
                  Text('See all', style: AppTextStyles.body),
                ],
              ),
            ),
            Center(child: Text('Welcome to the Breakfast Page!')),
          ],
        ),
      ),
    );
  }
}
