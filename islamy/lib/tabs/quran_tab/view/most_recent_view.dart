import 'package:flutter/material.dart';
import 'package:islamy/common/app_consts.dart';
import 'package:islamy/theme/app_colors.dart';

class MostRecentView extends StatelessWidget {
  const MostRecentView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 20.0),
          child: Text(
            'Most Ricent',
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontFamily: AppConsts.fontFamily),
          ),
        ),
        SizedBox(
            height: 150,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (context, index) => SizedBox(
                width: 290,
                child: Card(
                  margin: EdgeInsets.only(left: index == 0 ? 20 : 10),
                  color: AppColors.goldColor,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 8.0, bottom: 8, right: 8, left: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                'Al-Anbiya',
                                style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.blackColor),
                              ),
                              Text(
                                'الأنبياء',
                                style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.blackColor),
                              ),
                              Text(
                                '112 Verses',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.blackColor),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Image.asset(
                            AppConsts.suraCard,
                            height: 135,
                            fit: BoxFit.fill,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ))
      ],
    );
  }
}
