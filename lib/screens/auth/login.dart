import 'package:flutter/material.dart';
import 'package:oda/constants.dart';
import 'package:oda/screens/button.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'otp_verification.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController controller = TextEditingController();
  String initialCountry = 'UG';
  PhoneNumber number = PhoneNumber(isoCode: 'UG');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Image.asset('assets/branding/food_plate.png', width: 450),
              SizedBox(height: 20),
              InternationalPhoneNumberInput(
                hintText: 'Enter your phone number',
                onInputChanged: (PhoneNumber number) {
                  print(number.phoneNumber);
                },
                onInputValidated: (bool value) {
                  print(value);
                },
                selectorConfig: const SelectorConfig(
                  selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                  useBottomSheetSafeArea: true,
                ),
                ignoreBlank: false,
                autoValidateMode: AutovalidateMode.disabled,
                selectorTextStyle: const TextStyle(color: Colors.black),
                initialValue: number,
                textFieldController: controller,
                formatInput: true,
                keyboardType: const TextInputType.numberWithOptions(
                  signed: true,
                  decimal: true,
                ),
                // inputBorder: OutlineInputBorder(borderSide: BorderSide()),
                onSaved: (PhoneNumber number) {
                  print('On Saved: $number');
                },
              ),

              SizedBox(height: 30),

              Button(
                text: 'Next',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const OTPVerification(),
                    ),
                  );
                },
                // color: Colors.blue,
                // textColor: Colors.white,
              ),
              const SizedBox(height: 30),
              Row(
                children: [
                  Expanded(
                    child: Divider(color: Colors.grey[300], thickness: 1),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      'Or',
                      style: TextStyle(color: Colors.grey, fontSize: 16),
                    ),
                  ),
                  Expanded(
                    child: Divider(color: Colors.grey[300], thickness: 1),
                  ),
                ],
              ),
              const SizedBox(height: 40),
              Button(
                text: 'Continue with Google',
                icon: Image.asset(
                  'assets/branding/google.png',
                  width: 24,
                  height: 24,
                ),
                onPressed: () {
                  // Handle Google login action
                },
                elevation: 0,
                color: AppColors.white,
                textColor: AppColors.secondary,
              ),
              const SizedBox(height: 20),
              Button(
                text: 'Apple',
                icon: Image.asset(
                  'assets/branding/apple.png',
                  width: 24,
                  height: 24,
                ),
                onPressed: () {
                  // Handle Apple login action
                },
                elevation: 0,
                color: AppColors.white,
                textColor: AppColors.secondary,
              ),
              const Spacer(),

              Text(
                maxLines: 2,
                textAlign: TextAlign.center,
                'By signing up, you automatically accept our terms & conditions, privacy policy and cookie policy.',
                style: TextStyle(color: Colors.grey, fontSize: 14),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
