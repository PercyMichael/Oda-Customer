import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:oda/constants.dart';

class PaymentDetailsCard extends StatelessWidget {
  const PaymentDetailsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 15,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Payment Details', style: AppTextStyles.bodyTitle),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          decoration: BoxDecoration(
            color: Color.fromARGB(
              255,
              243,
              255,
              162,
            ), // Light yellow background
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              Container(
                width: 70,
                height: 70,
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: AssetImage(
                      'assets/branding/mtn.png',
                    ), // Replace with your image path
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: Text(
                  'Free deliveries on all MTN Mobile Money Payments',
                  style: AppTextStyles.bodySmall.copyWith(
                    color: AppColors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: AppColors.grey.withOpacity(0.3)),
          ),
          child: Row(
            children: [
              Icon(
                MaterialCommunityIcons.ticket_confirmation_outline,
                color: AppColors.grey,
              ),
              SizedBox(width: 10),
              Expanded(
                child: Text('Enter your promo code', style: AppTextStyles.body),
              ),
              Icon(
                Icons.keyboard_arrow_right_outlined,
                color: AppColors.grey,
                size: 30,
              ),
            ],
          ),
        ),
        Row(
          children: [
            Icon(Ionicons.ios_card, color: AppColors.secondary),
            SizedBox(width: 10),
            Text('Add Payment Methods', style: AppTextStyles.bodyTitle2),
            Spacer(),
            Icon(
              Icons.keyboard_arrow_right_outlined,
              color: AppColors.grey,
              size: 30,
            ),
          ],
        ),
      ],
    );
  }
}
