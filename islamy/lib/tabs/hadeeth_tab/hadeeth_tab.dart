import 'package:flutter/material.dart';
import 'package:islamy/common/app_consts.dart';
import 'package:islamy/theme/app_colors.dart';
import 'package:islamy/widgets/main_tab_design_widget.dart';

class HadeethTab extends StatefulWidget {
  const HadeethTab({super.key});

  @override
  State<HadeethTab> createState() => _HadeethTabState();
}

class _HadeethTabState extends State<HadeethTab> {
  final PageController _controller = PageController(viewportFraction: .8);
  int currantPage = 0;

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      setState(() {
        currantPage = (_controller.page ?? 0).toInt();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    const hadeethTitle = 'الحديث الأول';
    const hadeethText =
        'عن أمـيـر المؤمنـين أبي حـفص عمر بن الخطاب رضي الله عنه ، قال : '
        'سمعت رسول الله صلى الله عـليه وسلم يـقـول : ( إنـما الأعـمـال بالنيات '
        'وإنـمـا لكـل امـرئ ما نـوى . فمن كـانت هجرته إلى الله ورسولـه فهجرتـه '
        'إلى الله ورسـوله ومن كانت هجرته لـدنيا يصـيبها أو امرأة ينكحها فهجرته '
        'إلى ما هاجر إليه ).\n'
        'رواه إمام المحد ثين أبـو عـبـد الله محمد بن إسماعـيل بن ابراهـيـم بن '
        'المغـيره بن بـرد زبه البخاري الجعـفي،[رقم:1] وابـو الحسـيـن مسلم بن '
        'الحجاج بن مـسلم القـشـيري الـنيسـابـوري [رقم :1907] رضي الله عنهما في '
        'صحيحيهما اللذين هما أصح الكتب المصنفه.';

    return MainTabDesignWidget(
      imagePath: AppConsts.hadeethBg,
      child: Expanded(
        child: PageView.builder(
          controller: _controller,
          itemCount: 10,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.symmetric(
                vertical: currantPage != index ? 40 : 20,
              ),
              child: Container(
                padding: const EdgeInsets.all(12),
                margin: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: AppColors.goldColor,
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.asset(
                      AppConsts.hadeethCard,
                      fit: BoxFit.fill,
                    ),
                    SingleChildScrollView(
                      padding: const EdgeInsets.only(
                          top: 16, left: 20, right: 20, bottom: 12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            hadeethTitle,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                              color: AppColors.blackColor,
                            ),
                          ),
                          const SizedBox(height: 9), // 🔹 مسافة أصغر تحت العنوان
                          Text(
                            hadeethText,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: AppColors.blackColor,
                              height: 1.1, // 🔹 تقليل المسافة بين السطور
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
