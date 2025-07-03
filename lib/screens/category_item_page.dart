import 'package:flutter/material.dart';

class CategoryItemPage extends StatelessWidget {
  final String categoryName;

  const CategoryItemPage({super.key, required this.categoryName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(categoryName)),
      body: Center(child: Text('This is the $categoryName category page.')),
    );
  }
}
