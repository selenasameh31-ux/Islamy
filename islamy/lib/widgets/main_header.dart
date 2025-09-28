import 'package:flutter/material.dart';
import 'package:islamy/common/app_consts.dart';

class MainHeader extends StatelessWidget {
  const MainHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Image.asset(
        AppConsts.homeHeader,
        height: 140,
        width: 300,
      ),
    );
  }
}
