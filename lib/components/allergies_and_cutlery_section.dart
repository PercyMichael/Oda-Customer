import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:oda/constants.dart';
import 'package:oda/components/custom_filled_button.dart';

class AllergiesAndCutlerySection extends StatefulWidget {
  const AllergiesAndCutlerySection({super.key});

  @override
  State<AllergiesAndCutlerySection> createState() =>
      _AllergiesAndCutlerySectionState();
}

class _AllergiesAndCutlerySectionState
    extends State<AllergiesAndCutlerySection> {
  bool _needsCutlery = false; // State for the cutlery switch
  late TextEditingController _allergiesController;

  @override
  void initState() {
    super.initState();
    _allergiesController = TextEditingController();
  }

  @override
  void dispose() {
    _allergiesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Allergies Section
        ExpansionTile(
          // tilePadding: EdgeInsets.zero, // Remove default tile padding
          // childrenPadding: EdgeInsets.zero, // Remove default children padding
          expandedCrossAxisAlignment:
              CrossAxisAlignment.start, // Align content to start
          collapsedShape: const RoundedRectangleBorder(
            side: BorderSide.none,
          ), // Remove collapsed border
          shape: const RoundedRectangleBorder(side: BorderSide.none),
          title: Row(
            children: [
              Icon(MaterialCommunityIcons.allergy, color: AppColors.secondary),
              SizedBox(width: 10), // Added spacing
              Text(
                'Any Allergies',
                style: AppTextStyles.bodyTitle,
              ), // Changed to bodyTitle
            ],
          ),
          subtitle: Text(
            _allergiesController.text.isEmpty
                ? 'Please let us know'
                : _allergiesController.text,
            style: AppTextStyles.bodySmall,
          ),
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 8.0,
              ),
              child: Column(
                children: [
                  TextField(
                    controller: _allergiesController,
                    onChanged: (text) {
                      setState(() {}); // Update subtitle when text changes
                    },
                    decoration: InputDecoration(
                      hintText:
                          'Let the restaurant know what they should take into account',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: AppColors.grey.withOpacity(
                            0.5,
                          ), // Added border color
                          width: 1.0,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        // Added enabled border
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: AppColors.grey.withOpacity(0.5),
                          width: 1.0,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        // Added focused border
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color:
                              AppColors
                                  .secondary, // Use secondary color for focused border
                          width: 2.0,
                        ),
                      ),
                      filled: true,
                      fillColor: AppColors.background,
                    ),
                    maxLines: 3,
                  ),
                  SizedBox(height: 15),
                  CustomFilledButton(
                    text: 'Save',
                    onPressed: () {
                      // Save allergies logic
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: 20), // Add spacing after the ExpansionTile
        // Cutlery Section
        SwitchListTile(
          title: Row(
            children: [
              Icon(
                Icons.restaurant_menu,
                color: AppColors.secondary, // Changed to secondary color
              ),
              SizedBox(width: 10), // Added spacing
              Text('Need Cutlery', style: AppTextStyles.bodyTitle),
            ],
          ), // Changed to bodyTitle
          subtitle: Text(
            _needsCutlery
                ? 'Yes, i need cutlery.'
                : 'No, thank you.', // Dynamic subtitle
            style: AppTextStyles.bodySmall,
          ),
          value: _needsCutlery,
          onChanged: (bool value) {
            setState(() {
              _needsCutlery = value;
            });
          },
          activeColor: AppColors.secondary, // Changed to secondary color
        ),
      ],
    );
  }
}
