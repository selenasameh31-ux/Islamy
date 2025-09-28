import 'package:flutter/material.dart';
import 'package:islamy/common/app_consts.dart';
import 'package:islamy/screens/main_layer.dart';
import 'package:islamy/screens/onboarding.dart';
import 'package:islamy/theme/app_colors.dart';
import 'package:islamy/theme/app_theme.dart';
import 'dart:async';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.appTheme,
      home: Splashscreen1(),
    );
  }
}

class Splashscreen1 extends StatefulWidget {
  @override
  _Splashscreen1State createState() => _Splashscreen1State();
}

class _Splashscreen1State extends State<Splashscreen1> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => Splashscreen2()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/dd34714c0f92a7ebdecca9321419b045d91882d3.png',
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: 57,
            left: 35,
            width: 291,
            height: 157,
            child: Image.asset('assets/images/home_header.png',
                fit: BoxFit.contain),
          ),
          Positioned(
            left: 270,
            width: 88,
            height: 275,
            child: Image.asset('assets/images/Glow.png', fit: BoxFit.contain),
          ),
          Positioned(
            top: 190,
            left: 0,
            width: 85,
            height: 187,
            child: Image.asset('assets/images/Shape-07 1.png',
                fit: BoxFit.contain),
          ),
          
          Center(
  child: Image.asset(
    'assets/images/islami_logo.png', // 🔹 مسار الصورة
    width: 150, // ممكن تتحكمي في الحجم
    height: 150,
    fit: BoxFit.contain,
  ),
),


          
          Positioned(
            top: 540,
            right: 0,
            width: 85,
            height: 187,
            child: Image.asset('assets/images/Shape-04 1.png',
                fit: BoxFit.contain),
          ),
          Positioned(
            top: 630,
            left: 40,
            width: 280,
            height: 150,
            child: Image.asset(
              'assets/images/2af1dc6e1ebf2d114a74732b9b16454d85cd025b.png',
              fit: BoxFit.contain,
            ),
          ),
          Positioned(
            top: 730,
            left: 40,
            width: 280,
            child: Text(
              'Supervised by Mohamed Nabil',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: AppColors.goldColor,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Splashscreen2 extends StatefulWidget {
  @override
  _Splashscreen2State createState() => _Splashscreen2State();
}

class _Splashscreen2State extends State<Splashscreen2> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => OnboardingScreens()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColors.blackColor,
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              top: screenHeight * 0.35,
              left: screenWidth * 0.28,
              width: screenWidth * 0.4,
              height: screenHeight * 0.2,
              child: Image.asset(
                'assets/images/Group 28.png',
                fit: BoxFit.contain,
              ),
            ),
            Positioned(
              top: screenHeight * 0.7,
              left: screenWidth * 0.15,
              width: screenWidth * 0.7,
              height: screenHeight * 0.18,
              child: Image.asset(
                'assets/images/2af1dc6e1ebf2d114a74732b9b16454d85cd025b.png',
                fit: BoxFit.contain,
              ),
            ),
            Positioned(
              bottom: screenHeight * 0.05,
              left: screenWidth * 0.1,
              width: screenWidth * 0.8,
              child: Text(
                'Supervised by Mohamed Nabil',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: AppColors.goldColor,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
