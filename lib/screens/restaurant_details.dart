import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RestaurantDetails extends StatelessWidget {
  const RestaurantDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final restaurantName = Get.parameters['restaurantName'];
    return Scaffold(
      appBar: AppBar(title: Text(restaurantName ?? 'Restaurant Details')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Restaurant Details Page for $restaurantName'),
            ElevatedButton(
              onPressed: () {
                Get.back();
              },
              child: const Text('Go Back'),
            ),
          ],
        ),
      ),
    );
  }
}
