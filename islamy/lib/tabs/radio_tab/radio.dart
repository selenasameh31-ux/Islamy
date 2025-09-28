import 'package:flutter/material.dart';
import 'package:islamy/common/app_consts.dart';
import 'package:islamy/theme/app_colors.dart';

class RadioScreen extends StatefulWidget {
  const RadioScreen({super.key});

  @override
  State<RadioScreen> createState() => _RadioScreenState();
}

class _RadioScreenState extends State<RadioScreen> {
  int selectedButton = 0;

  int playingIndex = 1;
  List<String> btNames = ['Radio', 'Reciters'];
  List<List<Map<String, String>>> cardsContent = [
    [
      {'name': 'Radio Ibrahim Al-Akdar'},
      {'name': 'Radio Al-Qaria Yassen'},
      {'name': 'Radio Ahmed Al-trabulsi'},
      {'name': 'Radio Addokali Mohammad Alalim'},
    ],
    [
      {'name': 'Ibrahim Al-Akdar'},
      {'name': 'Akram Alalaqmi'},
      {'name': 'Majed Al-Enezi'},
      {'name': 'Majed Al-Enezi'},
    ],
  ];

  bool isMuted(int index) => (playingIndex != index);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  "assets/images/Background (3).png",
                ),

                fit: BoxFit.cover,
              ),
            ),
          ),

          Container(color: AppColors.blackColor.withOpacity(0.55)),

          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    Image.asset("assets/images/home_header.png", width: 260),
                    
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(btNames.length, (i) {
                    final selected = i == selectedButton;
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedButton = i;
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 0),
                        width: 145,
                        height: 40,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color:
                              selected
                                  ? AppColors.goldColor
                                  : Colors.black.withOpacity(0.60),
                          borderRadius: BorderRadius.circular(10),

                          border: Border.all(
                            color:
                                selected
                                    ? AppColors.goldColor
                                    : Colors.transparent,
                          ),
                        ),
                        child: Text(
                          btNames[i],
                          style: TextStyle(
                            color:
                                selected
                                    ? AppColors.blackColor
                                    : AppColors.whiteColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ),

              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 10,
                  ),
                  itemCount: cardsContent[selectedButton].length,
                  itemBuilder: (context, i) {
                    bool isPlaying = i == playingIndex;
                    return Container(
                      margin: EdgeInsets.symmetric(vertical: 5),
                      padding: EdgeInsets.all(18),
                      decoration: BoxDecoration(
                        color: AppColors.goldColor,
                        borderRadius: BorderRadius.circular(28),
                      ),

                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Text(
                              cardsContent[selectedButton][i]['name']!,
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          SizedBox(height: 16),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    playingIndex = i;
                                  });
                                },
                                child: Icon(
                                  isPlaying ? Icons.pause : Icons.play_arrow,
                                  size: 40,
                                  color: AppColors.blackColor,
                                ),
                              ),
                              SizedBox(width: 15),

                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    if (playingIndex == i) {
                                      playingIndex = -1;
                                    } else {
                                      playingIndex = i;
                                    }
                                  });
                                },
                                child: Icon(
                                  isMuted(i)
                                      ? Icons.volume_off
                                      : Icons.volume_up,
                                  size: 30,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}