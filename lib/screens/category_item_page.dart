import 'package:flutter/material.dart';

class CategoryItemPage extends StatelessWidget {
  final String categoryName;

  const CategoryItemPage({Key? key, required this.categoryName})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(categoryName)),
      body: Center(child: Text('This is the $categoryName category page.')),
    );
  }
}
