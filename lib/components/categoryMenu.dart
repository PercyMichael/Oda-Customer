import 'package:flutter/material.dart';
import 'package:oda/constants.dart';

class CategoryMenu extends StatefulWidget {
  final Function(int) onCategorySelected;

  CategoryMenu({required this.onCategorySelected});

  @override
  _CategoryMenuState createState() => _CategoryMenuState();
}

class _CategoryMenuState extends State<CategoryMenu> {
  int selectedIndex = 0; // Default selected: Breakfast

  final List<Map<String, dynamic>> categories = [
    {'icon': Icons.free_breakfast, 'label': 'Breakfast'},
    {'icon': Icons.fastfood, 'label': 'Meals'},
    {'icon': Icons.local_drink, 'label': 'Drinks'},
    {'icon': Icons.more_horiz, 'label': 'Others'},
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 130,
      child: Column(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                // gradient: LinearGradient(
                //   colors: [
                //     AppColors.secondary.withAlpha(100),
                //     Color(0xFFF6FAFB),
                //   ],
                //   begin: Alignment.topCenter,
                //   end: Alignment.bottomCenter,
                // ),
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(50),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 12,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: List.generate(categories.length, (index) {
                    final item = categories[index];
                    final isSelected = index == selectedIndex;

                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedIndex = index;
                        });
                        widget.onCategorySelected(index);
                      },
                      child: Column(
                        children: [
                          CircleAvatar(
                            radius: isSelected ? 30 : 28,
                            backgroundColor: AppColors.secondary,
                            child: Icon(
                              item['icon'],
                              color: Colors.white,
                              size: isSelected ? 28 : 24,
                            ),
                          ),
                          SizedBox(height: 6),
                          Text(
                            item['label'],
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight:
                                  isSelected
                                      ? FontWeight.bold
                                      : FontWeight.normal,
                              color: isSelected ? Colors.black : Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
