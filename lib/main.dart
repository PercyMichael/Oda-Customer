import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oda/constants.dart';
import 'package:oda/screens/auth/login.dart';
import 'package:oda/screens/auth/onboard.dart';
import 'package:oda/screens/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: AppColors.white,
      ),

      home: const Home(),
      initialRoute: '/onboard',
      getPages: [
        GetPage(name: '/', page: () => Home()),
        GetPage(name: '/onboard', page: () => onBoard()),
        GetPage(name: '/login', page: () => Login()),
      ],
    );
  }
}
