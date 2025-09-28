import 'package:flutter/material.dart';
import 'dart:math';
import 'package:islamy/common/app_consts.dart';
import 'package:islamy/theme/app_colors.dart';

class SebhaScreen extends StatefulWidget {
  const SebhaScreen({super.key});

  @override
  State<SebhaScreen> createState() => _SebhaScreenState();
}

class _SebhaScreenState extends State<SebhaScreen> {
  int counter = 0;
  double rotation = 0.0;

  final int beadsCount = 33;
  late List<String> phrases;

  @override
  void initState() {
    phrases = ["سبحان الله", "الحمد لله", "الله أكبر", "لا إله إلا الله"];
    super.initState();
  }

  double get singleBeadRotation => 2 * pi / beadsCount;

  String get currentPhrase {
    if (counter < 33) return phrases[0];
    if (counter < 66) return phrases[1];
    if (counter < 99) return phrases[2];
    if (counter == 99) return phrases[3];
    return phrases[0];
  }

  int get displayCounter {
    /// كل 33 مرة بنبدأ من 1 ل 33
    if (counter < 99) {
      return (counter % 33) + 1;
    }

    /// فاللفة رقم 100 بيظهر ال counter ب 1
    if (counter == 99) return 1;
    return 1;
  }

  void handleTap() {
    setState(() {
      if (counter == 99) {
        // بعد اللفة رقم 100 لو دوست تاني هترجع لل 1
        counter = 0;
        rotation = 0.0;
      } else {
        counter++;
        rotation += singleBeadRotation;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                "assets/images/Background (4).png",
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(color: Colors.black.withOpacity(0.5)),

        Positioned(
          top: 25,
          left: 55,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Image.asset(
                "assets/images/home_header.png",
                width: 250,
                fit: BoxFit.contain,
              ),

              
            ],
          ),
        ),

        Positioned(
          top: 155,
          left: 15,
          right: 15,
          child: Center(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 8),
              child: Text(
                "سَبِّحِ اسْمَ رَبِّكَ الْأَعْلَى",
                style: TextStyle(
                  fontSize: 36,
                  color: AppColors.offWhiteColor,
                  fontWeight: FontWeight.w700,
                  fontFamily: AppConsts.fontFamily,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),

        Positioned(
          top: 290,
          left: 0,
          right: 0,
          child: Center(
            child: GestureDetector(
              onTap: handleTap,
              child: Transform.rotate(
                angle: rotation,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.asset("assets/images/SebhaBody 1.png", width: 280),

                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Flexible(
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 8),
                            child: Text(
                              currentPhrase,
                              style: TextStyle(
                                fontSize: 35,
                                color: AppColors.offWhiteColor,
                                fontWeight: FontWeight.w700,
                                fontFamily: AppConsts.fontFamily,
                              ),
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.visible,
                            ),
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          '$displayCounter',
                          style: TextStyle(
                            fontSize: 36,
                            color: AppColors.offWhiteColor,
                            fontWeight: FontWeight.w700,
                            fontFamily: AppConsts.fontFamily,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}