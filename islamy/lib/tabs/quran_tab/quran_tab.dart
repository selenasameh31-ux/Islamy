import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:islamy/common/app_consts.dart';
import 'package:islamy/tabs/quran_tab/view/most_recent_view.dart';
import 'package:islamy/tabs/quran_tab/view/suras_list_view.dart';
import 'package:islamy/tabs/quran_tab/widgets/custom_text_field.dart';
import 'package:islamy/theme/app_colors.dart';
import 'package:islamy/widgets/main_tab_design_widget.dart';

class QuranTab extends StatelessWidget {
  const QuranTab({super.key});

  @override
  Widget build(BuildContext context) {
    return MainTabDesignWidget(
      imagePath: AppConsts.quranTabBg,
      child: Expanded(
        child: Column(
          spacing: 20,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomTextField(
              hintText: 'surah name',
              prefixIcon: SvgPicture.asset(
                AppConsts.quranIcon,
                colorFilter: const ColorFilter.mode(
                    AppColors.goldColor, BlendMode.srcIn),
              ),
            ),
            const Expanded(
              child: SingleChildScrollView(
                child: Column(
                  spacing: 20,
                  children: [
                    MostRecentView(),
                    SurasListView(),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
//custom scroll view
