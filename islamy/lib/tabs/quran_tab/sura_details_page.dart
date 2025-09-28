import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamy/common/app_consts.dart';
import 'package:islamy/models/sura_model.dart';
import 'package:islamy/theme/app_colors.dart';

class SuraDetailsPage extends StatefulWidget {
  static const String routeName = '/SuraDetailsPage';
  const SuraDetailsPage({super.key});

  @override
  State<SuraDetailsPage> createState() => _SuraDetailsPageState();
}

class _SuraDetailsPageState extends State<SuraDetailsPage> {
  String suraDetails = '';
  List<String> ayat = [];
  @override
  Widget build(BuildContext context) {
    SuraModel suraModel =
        ModalRoute.of(context)!.settings.arguments as SuraModel;
    if (suraDetails.isEmpty) {
      getSuraDetails(suraModel.index);
    }
    return Scaffold(
      backgroundColor: AppColors.blackColor,
      appBar: AppBar(
        title: Text(suraModel.enName),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            AppConsts.detailsBg,
            fit: BoxFit.fill,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 20,
              ),
              Text(
                suraModel.arName,
                style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: AppColors.goldColor),
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.only(left: 30.0, right: 30.0),
                  child: RichText(
                    text: TextSpan(
                      children: ayat
                          .map(
                            (e) => TextSpan(text: e + ' * '),
                          )
                          .toList(),
                      style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: AppColors.goldColor),
                    ),
                    textDirection: TextDirection.rtl,
                    textAlign: TextAlign.justify,
                  ),
                ),
              ),
              const SizedBox(
                height: 150,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future<void> getSuraDetails(int index) async {
    String res = await rootBundle.loadString('assets/Suras/${index}.txt');

    setState(() {
      ayat = res.trim().split('\n');
      suraDetails = res;
      print('----->${ayat.length}');
    });
  }
}
///