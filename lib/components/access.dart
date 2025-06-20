import 'package:flutter/material.dart';
import 'package:oda/constants.dart';

class Access extends StatefulWidget {
  const Access({super.key});

  @override
  State<Access> createState() => _AccessState();
}

class _AccessState extends State<Access> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 8, offset: Offset(0, 4)),
        ],
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(
            backgroundColor: AppColors.secondary,
            child: Icon(Icons.delivery_dining, color: Colors.white),
          ),
          const SizedBox(width: 10),
          CircleAvatar(
            backgroundColor: AppColors.secondary,
            child: Icon(Icons.access_time_outlined, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
