import 'package:flutter/material.dart';
import 'package:islamy/theme/app_colors.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key, this.hintText, this.prefixIcon, this.padding});
  final String? hintText;
  final Widget? prefixIcon;
  final EdgeInsetsGeometry? padding;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? const EdgeInsets.symmetric(horizontal: 20.0),
      child: TextField(
        cursorColor: AppColors.goldColor,
        style: const TextStyle(
            color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
        decoration: InputDecoration(
            filled: true,
            fillColor: AppColors.blackColor.withValues(alpha: .7),
            border: _getBorder(),
            enabledBorder: _getBorder(),
            focusedBorder: _getBorder()
                .copyWith(borderSide: BorderSide(color: AppColors.goldColor)),
            hintText: hintText,
            prefixIcon: Padding(
              padding: const EdgeInsets.all(10.0),
              child: prefixIcon,
            ),
            hintStyle: TextStyle(
                color: Colors.white.withValues(alpha: .5),
                fontSize: 16,
                fontWeight: FontWeight.normal)),
      ),
    );
  }

  OutlineInputBorder _getBorder() {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: AppColors.greyColor));
  }
}
