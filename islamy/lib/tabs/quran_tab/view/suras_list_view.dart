import 'package:flutter/material.dart';
import 'package:islamy/common/app_consts.dart';
import 'package:islamy/models/sura_model.dart';
import 'package:islamy/tabs/quran_tab/sura_details_page.dart';
import 'package:islamy/theme/app_colors.dart';

class SurasListView extends StatelessWidget {
  const SurasListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 20.0),
          child: Text(
            'Suras List',
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontFamily: AppConsts.fontFamily),
          ),
        ),
        ListView.separated(
          itemCount: SuraModel.surasList.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            SuraModel currantSura = SuraModel.surasList[index];

            return ListTile(
              onTap: () => Navigator.of(context)
                  .pushNamed(SuraDetailsPage.routeName, arguments: currantSura),
              leading: Stack(
                alignment: Alignment.center,
                children: [
                  const Icon(
                    Icons.brightness_5,
                    size: 55,
                    color: Colors.white,
                  ),
                  Text(
                    currantSura.index.toString(),
                    style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontFamily: AppConsts.fontFamily),
                  )
                ],
              ),
              title: Text(
                currantSura.enName,
                style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontFamily: AppConsts.fontFamily),
              ),
              subtitle: Text(
                '${currantSura.versesCount} Verses',
                style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontFamily: AppConsts.fontFamily),
              ),
              trailing: Text(
                currantSura.arName,
                style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontFamily: AppConsts.fontFamily),
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return const Divider(
              endIndent: 65,
              indent: 65,
              color: AppColors.goldColor,
            );
          },
        )
      ],
    );
  }
}
