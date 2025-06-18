import 'package:flutter/material.dart';
import 'package:oda/constants.dart';
import 'package:oda/screens/button.dart';
import 'package:intl_phone_number_field/intl_phone_number_field.dart';
import 'otp_verification.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Image.asset('assets/branding/food_plate.png', width: 350),
              InternationalPhoneNumberInput(
                height: 60,
                //controller: controller,
                inputFormatters: const [],
                //formatter: MaskedInputFormatter('### ### ## ##'),
                //initCountry: CountryCodeModel(
                //    name: "United States", dial_code: "+1", code: "US"),
                betweenPadding: 23,
                onInputChanged: (phone) {
                  print(phone.code);
                  print(phone.dial_code);
                  print(phone.number);
                  print(phone.rawFullNumber);
                  print(phone.rawNumber);
                  print(phone.rawDialCode);
                },
                //loadFromJson: loadFromJson,
                dialogConfig: DialogConfig(
                  backgroundColor: const Color(0xFF444448),
                  searchBoxBackgroundColor: const Color(0xFF56565a),
                  searchBoxIconColor: const Color(0xFFFAFAFA),
                  countryItemHeight: 55,
                  flatFlag: true,
                  topBarColor: const Color(0xFF1B1C24),
                  selectedItemColor: const Color(0xFF56565a),
                  selectedIcon: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Image.asset(
                      "assets/check.png",
                      width: 20,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  textStyle: TextStyle(
                    color: const Color(0xFFFAFAFA).withOpacity(0.7),
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                  searchBoxTextStyle: TextStyle(
                    color: const Color(0xFFFAFAFA).withOpacity(0.7),
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                  titleStyle: const TextStyle(
                    color: Color(0xFFFAFAFA),
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                  searchBoxHintStyle: TextStyle(
                    color: const Color(0xFFFAFAFA).withOpacity(0.7),
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                countryConfig: CountryConfig(
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 2,
                      color: const Color(0xFF3f4046),
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  noFlag: false,
                  textStyle: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                validator: (number) {
                  if (number.number.isEmpty) {
                    return "The phone number cannot be left emptyssss";
                  }
                  return null;
                },
                phoneConfig: PhoneConfig(
                  focusedColor: const Color(0xFF6D59BD),
                  enabledColor: const Color(0xFF6D59BD),
                  errorColor: const Color(0xFFFF5494),
                  labelStyle: null,
                  labelText: null,
                  floatingLabelStyle: null,
                  focusNode: null,
                  radius: 8,
                  hintText: "Phone Number",
                  borderWidth: 2,
                  backgroundColor: Colors.transparent,
                  decoration: null,
                  popUpErrorText: true,
                  autoFocus: false,
                  showCursor: false,
                  textInputAction: TextInputAction.done,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  errorTextMaxLength: 2,
                  errorPadding: const EdgeInsets.only(top: 14),
                  errorStyle: const TextStyle(
                    color: Color(0xFFFF5494),
                    fontSize: 12,
                    height: 1,
                  ),
                  textStyle: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                  hintStyle: TextStyle(
                    color: Colors.black.withOpacity(0.5),
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              SizedBox(height: 20),

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
              const SizedBox(height: 20),
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
              const SizedBox(height: 20),
              Button(
                text: 'Continue with Google',
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
                onPressed: () {
                  // Handle Facebook login action
                },
                elevation: 0,
                color: AppColors.white,
                textColor: AppColors.secondary,
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Don\'t have an account?'),
                  TextButton(
                    onPressed: () {
                      // Navigate to sign up screen
                    },
                    child: Text('Sign Up'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
