import 'package:flutter/material.dart';
import 'package:islamy/theme/app_colors.dart';
import 'package:islamy/widgets/main_header.dart';

class MainTabDesignWidget extends StatelessWidget {
  const MainTabDesignWidget(
      {super.key, required this.imagePath, required this.child});
  final String imagePath;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(imagePath), fit: BoxFit.cover),
      ),
      child: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [AppColors.blackColor.withAlpha(180), AppColors.blackColor],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [const MainHeader(), child],
          ),
        ),
      ),
    );
  }
}
