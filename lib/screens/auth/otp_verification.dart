import 'package:flutter/material.dart';
import 'package:oda/constants.dart';
import 'package:oda/components/button.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';

class OTPVerification extends StatefulWidget {
  const OTPVerification({super.key});

  @override
  State<OTPVerification> createState() => _OTPVerificationState();
}

class _OTPVerificationState extends State<OTPVerification> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(Ionicons.chevron_back, size: 30),
        ),
        title: Text('Verify OTP'),
        elevation: 0,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Enter the OTP sent to your phone number and completely verify your account.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            OtpTextField(
              keyboardType: TextInputType.number,
              textStyle: const TextStyle(fontSize: 35),
              clearText: true,
              numberOfFields: 4,
              focusedBorderColor: AppColors.primary,
              borderColor: AppColors.primary,
              //set to true to show as box or false to show as dash
              showFieldAsBox: false,
              //runs when a code is typed in
              onCodeChanged: (String code) {
                //handle validation or call API
              },
              //runs when every textfield is filled
              onSubmit: (String verificationCode) {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: const Text("Verification Code"),
                      content: Text('Code entered is $verificationCode'),
                    );
                  },
                );
              }, // end onSubmit
            ),
            const SizedBox(height: 30),
            //a code has been sent to the phone number
            const Text(
              'A code has been sent to your phone number.',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 10),
            //resend code in 30 seconds
            Text(
              'Resend code in 30 seconds',
              style: AppTextStyles.body.copyWith(
                color: AppColors.secondary,
                fontSize: 16,
              ),
            ),
            SizedBox(height: 30),

            Button(
              text: 'Verify OTP',
              color: AppColors.secondary,
              elevation: 0,
              onPressed: () {
                // Navigate to home screen
                Get.offAllNamed('/home');
              },
            ),
          ],
        ),
      ),
    );
  }
}
