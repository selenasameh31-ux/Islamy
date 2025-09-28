import 'package:flutter/material.dart';
import 'package:islamy/common/app_consts.dart';
import 'package:islamy/theme/app_colors.dart';
import 'package:islamy/screens/main_layer.dart';

class OnboardingScreens extends StatefulWidget {
  @override
  State<OnboardingScreens> createState() => _OnboardingScreensState();
}

class _OnboardingScreensState extends State<OnboardingScreens> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<Map<String, dynamic>> data = [
    {
      "topbackimage": "assets/images/home_header.png",
      "center": "assets/images/Frame 3.png",
      "welcometext": "Welcome To Islami App",
    },
    {
      "topbackimage": "assets/images/home_header.png",
      "center": "assets/images/kabba.png",
      "title": "Welcome To Islami",
      "bottomTitle": "We Are Very Excited To Have You In Our Community",
    },
    {
      "topbackimage": "assets/images/home_header.png",
      "center": "assets/images/1eee3505289310e0cfc11dd67dced3869db67b05.png",
      "title": "Reading the Quran",
      "bottomTitle": "Read, and your Lord is the Most Generous",
    },
    {
      "topbackimage": "assets/images/home_header.png",
      "center": "assets/images/8cdade62b49226d698fe69b38c30a1796aebd4e9.png",
      "title": "Bearish",
      "bottomTitle": "Praise the name of your Lord, the Most High",
    },
    {
      "topbackimage": "assets/images/home_header.png",
      "center": "assets/images/996f704874c03b402094268c72e156e63f8425e9.png",
      "title": "Holy Quran Radio",
      "bottomTitle":
          "You can listen to the Holy Quran Radio through the application for free and easily",
    },
  ];

  void _gotoPage(int i) {
    _pageController.animateToPage(
      i,
      duration: const Duration(milliseconds: 350),
      curve: Curves.ease,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackColor,
      body: SafeArea(
        child: Stack(
          children: [
            PageView.builder(
              controller: _pageController,
              itemCount: data.length,
              onPageChanged: (v) => setState(() => _currentPage = v),
              itemBuilder: (_, i) => Column(
                children: [
                  // ▪️ صورة الخلفية فقط (تم حذف كلمة Islami)
                  Image.asset(
                    data[i]["topbackimage"],
                    width: 291,
                    height: 170,
                  ),

                  // ▪️ صورة المنتصف
                  Image.asset(
                    data[i]["center"],
                    width: 398,
                    height: 250,
                  ),

                  SizedBox(
                    height: i == 0 &&
                            data[i]["welcometext"] != null &&
                            data[i]["welcometext"].toString().isNotEmpty
                        ? 100
                        : 25,
                  ),

                  // ▪️ نص الترحيب في الصفحة الأولى
                  if (i == 0 &&
                      data[i]["welcometext"] != null &&
                      data[i]["welcometext"].toString().isNotEmpty)
                    Text(
                      data[i]["welcometext"],
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: AppColors.goldColor,
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        fontFamily: AppConsts.fontFamily,
                      ),
                    ),

                  // ▪️ باقي الصفحات (العنوان والنص السفلي)
                  if (i > 0) ...[
                    const SizedBox(height: 25),
                    Text(
                      data[i]["title"],
                      style: TextStyle(
                        color: AppColors.goldColor,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        fontFamily: AppConsts.fontFamily,
                      ),
                    ),
                    const SizedBox(height: 15),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Text(
                        data[i]["bottomTitle"],
                        style: TextStyle(
                          color: AppColors.goldColor,
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          fontFamily: AppConsts.fontFamily,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],

                  const Spacer(),

                  // ▪️ أزرار التنقل والمؤشرات
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 28),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (_currentPage > 0)
                          TextButton(
                            onPressed: () => _gotoPage(_currentPage - 1),
                            child: Text(
                              "Back",
                              style: TextStyle(
                                color: AppColors.goldColor,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                fontFamily: AppConsts.fontFamily,
                              ),
                            ),
                          )
                        else
                          const SizedBox(width: 40),
                        const SizedBox(width: 12),
                        ...List.generate(data.length, (idx) {
                          bool active = idx == _currentPage;
                          return AnimatedContainer(
                            duration: const Duration(milliseconds: 250),
                            margin: const EdgeInsets.symmetric(horizontal: 3.5),
                            width: active ? 22 : 8,
                            height: 8,
                            decoration: BoxDecoration(
                              color: active
                                  ? AppColors.goldColor
                                  : AppColors.greyColor,
                              borderRadius: BorderRadius.circular(8),
                              border: active
                                  ? Border.all(
                                      color: AppColors.goldColor,
                                      width: 1,
                                    )
                                  : null,
                            ),
                          );
                        }),
                        const SizedBox(width: 12),
                        if (_currentPage == data.length - 1)
                          TextButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const MainLayer(),
                                ),
                              );
                            },
                            child: Text(
                              "Finish",
                              style: TextStyle(
                                color: AppColors.goldColor,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                fontFamily: AppConsts.fontFamily,
                              ),
                            ),
                          )
                        else
                          TextButton(
                            onPressed: () {
                              if (_currentPage < data.length - 1) {
                                _gotoPage(_currentPage + 1);
                              }
                            },
                            child: Text(
                              "Next",
                              style: TextStyle(
                                color: AppColors.goldColor,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                fontFamily: AppConsts.fontFamily,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
