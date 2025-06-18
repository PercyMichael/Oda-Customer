import 'package:flutter/material.dart';
import 'package:oda/constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
            Text(
              "I'm here",
              style: AppTextStyles.bodyTitle2.copyWith(
                color: AppColors.textSecondary,
              ),
            ),
            Text('Welcome to the Home Screen', style: AppTextStyles.bodyTitle),
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
      body: Center(child: Text('Home Screen')),
    );
  }
}
