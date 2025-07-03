import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:oda/components/categoryMenu.dart';
import 'package:oda/constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Map<String, dynamic>> categories = [
    {'icon': Icons.free_breakfast, 'label': 'Breakfast'},
    {'icon': Icons.fastfood, 'label': 'Meals'},
    {'icon': Icons.local_drink, 'label': 'Drinks'},
    {'icon': Icons.more_horiz, 'label': 'Others'},
  ];

  int selectedCategoryIndex = 0; // Default: Breakfast selected

  void _onCategorySelected(int index) {
    setState(() {
      selectedCategoryIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Image.asset(
            'assets/branding/leading.png',
            width: 80,
            height: 80,
          ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              spacing: 5,
              children: [
                Text(
                  "I'm here",
                  style: AppTextStyles.bodyTitle2.copyWith(
                    color: AppColors.textSecondary,
                  ),
                ),
                Icon(
                  FontAwesome5Solid.hand_point_down,
                  color: AppColors.secondary,
                  size: 20,
                ),
              ],
            ),
            Row(
              children: [
                Text('Ntinda ,Plot 6/7', style: AppTextStyles.bodyTitle),
                Icon(Entypo.chevron_right, size: 25),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Image.asset(
              'assets/branding/actions.png',
              width: 80,
              height: 80,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          //SEARCH BAR
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
                  borderSide: BorderSide(color: AppColors.secondary, width: 2),
                  borderRadius: BorderRadius.circular(100),
                ),
              ),
            ),
          ),

          //END OF SEARCH BAR

          //tabs
          CategoryMenu(onCategorySelected: _onCategorySelected),

          if (selectedCategoryIndex >= 0 &&
              selectedCategoryIndex < categories.length)
            Container(
              width: 350,
              height: 350,
              decoration: BoxDecoration(
                color: AppColors.secondary.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              alignment: Alignment.center,
              child: Image.asset(
                'assets/branding/${categories[selectedCategoryIndex]['label']}.png',
                height: 370,
                fit: BoxFit.contain,
              ),
            ),
          SizedBox(height: 20),
          //oda button
          FilledButton(
            onPressed: () {
              // Handle the oda button action
              Get.toNamed(
                '/break_fast',
                // arguments: {
                //   'category': categories[selectedCategoryIndex]['label'],
                // },
              );
            },
            style: FilledButton.styleFrom(
              backgroundColor: AppColors.secondary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  selectedCategoryIndex >= 0 &&
                          selectedCategoryIndex < categories.length
                      ? 'Oda For ${categories[selectedCategoryIndex]['label']}'
                      : 'Select a category',
                  style: AppTextStyles.button.copyWith(color: Colors.white),
                ),
                const SizedBox(width: 10),
                Icon(
                  FontAwesome5Solid.arrow_right,
                  color: Colors.white,
                  size: 20,
                ),
              ],
            ),
          ),
        ],
      ),

      //bottom navigation bar
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              color: AppColors.secondary.withOpacity(0.5), // Choose your color
              width: 1.0, // Choose your border thickness
            ),
          ),
        ),
        child: BottomAppBar(
          color: Colors.white,
          shadowColor: Colors.black,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                'assets/branding/schedule.png',
                width: 50,
                height: 50,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Want your meal delivered later?',
                    textAlign: TextAlign.center,
                    style: AppTextStyles.bodyTitle2.copyWith(
                      color: AppColors.secondary,
                    ),
                  ),
                  Text(
                    'Schedule  now, we will deliver.',
                    style: AppTextStyles.body.copyWith(
                      color: AppColors.textSecondary,
                    ),
                  ),
                ],
              ),

              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: AppColors.secondary.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(100),
                ),
                child: IconButton(
                  onPressed: () {
                    Get.toNamed('/tab'); // Navigate to the tab screen
                    // Handle the action for the floating action button
                  },
                  icon: Icon(
                    FontAwesome5Solid.arrow_right,
                    color: AppColors.secondary,
                    size: 21,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
