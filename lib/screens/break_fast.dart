import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:oda/components/categoryItem.dart';
import 'package:oda/components/access.dart';
import 'package:oda/components/customBackButton.dart';
import 'package:oda/components/lastOrderCard.dart';
import 'package:oda/components/restaurantCard.dart';
import 'package:oda/components/searchBox.dart';
import 'package:oda/components/sectionTitle.dart';
import 'package:oda/constants.dart';
import 'package:get/get.dart';
import 'package:oda/data/data.dart';
import 'package:oda/data/data.dart' as data;
import 'package:oda/models/restaurant.dart';

class BreakFast extends StatefulWidget {
  const BreakFast({Key? key}) : super(key: key);

  @override
  State<BreakFast> createState() => _BreakFastState();
}

class _BreakFastState extends State<BreakFast> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              spacing: 20,
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
                GridView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    mainAxisSpacing: 5,
                    crossAxisSpacing: 0,
                    childAspectRatio: 0.90,
                  ),
                  itemCount: data.categories.length,
                  itemBuilder: (context, index) {
                    final category = data.categories[index];
                    return CategoryItem(
                      name: category.name,
                      navigationLink: category.navigationLink,
                      imagePath: category.imagePath,
                    );
                  },
                ),

                // Restaurant Grid
                Column(
                  children: [
                    SectionTitle(title: 'Restaurants'),
                    GridView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4,
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 10,
                            childAspectRatio: 0.8,
                          ),
                      itemCount: data.restaurants.length,
                      itemBuilder: (context, index) {
                        final restaurant = data.restaurants[index];
                        return GestureDetector(
                          onTap: () {
                            Get.toNamed(
                              '/restaurant_details',
                              parameters: {'restaurantName': restaurant.name},
                            );
                          },
                          child: RestaurantCard(
                            restaurant: restaurant.toJson(),
                          ),
                        );
                      },
                    ),
                  ],
                ),

                //From Last order section
                SectionTitle(title: 'From Last Order'),
                GridView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 20,
                    childAspectRatio: 0.69,
                  ),
                  itemCount: data.lastOrders.length,
                  itemBuilder: (context, index) {
                    final lastOrderItem = data.lastOrders[index];
                    return LastOrderCard(lastOrderItem: lastOrderItem);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
