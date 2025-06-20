import 'package:flutter/material.dart';

class Access extends StatefulWidget {
  const Access({super.key});

  @override
  State<Access> createState() => _AccessState();
}

class _AccessState extends State<Access> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Icon(Icons.delivery_dining),
          Icon(Icons.access_time_outlined),
        ],
      ),
    );
  }
}
