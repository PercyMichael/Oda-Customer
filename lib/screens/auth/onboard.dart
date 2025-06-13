import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oda/constants.dart';
import 'package:carousel_slider/carousel_slider.dart';

class onBoard extends StatefulWidget {
  const onBoard({Key? key}) : super(key: key);

  @override
  State<onBoard> createState() => _onBoardState();
}

class _onBoardState extends State<onBoard> {
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: AppColors.primary,
        width: double.infinity,
        height: double.infinity,
        // padding: const EdgeInsets.all(20.0),
        child: SafeArea(
          child: Center(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 40),
                  child: CarouselSlider(
                    options: CarouselOptions(
                      height: 350.0,
                      autoPlay: true,
                      enlargeCenterPage: true,
                      aspectRatio: 9 / 16,
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enableInfiniteScroll: true,
                      autoPlayAnimationDuration: Duration(milliseconds: 800),
                      viewportFraction: 0.58,
                      onPageChanged: (index, reason) {
                        setState(() {
                          _currentPage = index;
                        });
                      },
                    ),
                    items: [1, 2, 3, 4].map((i) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Container(
                            height: 100,
                            child: Image.asset(
                              'assets/branding/Frame 1261157968.png',
                              fit: BoxFit.cover,
                            ),
                          );
                        },
                      );
                    }).toList(),
                  ),
                ),

                Image.asset('assets/branding/logo.png', width: 200),

                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 60),
                  child: FilledButton(
                    onPressed: () {
                      // Navigate to the login screen using GetX
                      Get.toNamed('/login');
                    },
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      backgroundColor: AppColors.secondary,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 50,
                        vertical: 15,
                      ),
                      textStyle: AppTextStyles.button.copyWith(
                        color: AppColors.white,
                      ),
                    ),
                    child: const Text('Get Started'),
                  ),
                ),

                const Spacer(),

                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Image.asset('assets/branding/powered.png', width: 100),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
