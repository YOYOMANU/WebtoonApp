import 'package:app/models/anime_coming_model.dart';
import 'package:app/models/anime_model.dart';
import 'package:app/models/anime_release_model.dart';
import 'package:app/themes/app_colors.dart';
import 'package:app/widgets/anim_release.dart';
import 'package:app/widgets/appbar_home.dart';
import 'package:app/widgets/card_anim.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<AnimeModel> animeModels = [
    AnimeModel(
      imagePath: "assets/images/one-piece-covers2.png",
      title: "One Piece",
      chapter: " Chapters: 1067",
      countStars: 7.9,
    ),
    AnimeModel(
      imagePath:
          "assets/images/haikyuu-haikyuu-anime-character-wallpaper-preview 1.png",
      title: "haikyuu-haikyuu",
      chapter: " Chapters: 370",
      countStars: 5.8,
    ),
  ];

  final List<AnimeReleaseModel> AnimeReleaseModels = [
    AnimeReleaseModel(
      imagePath: "assets/images/Volume_1 1.png",
      title: "Jujustu Kiasen",
    ),
    AnimeReleaseModel(
      imagePath: "assets/images/Solo_Leveling_Returns 1.png",
      title: "My Hero Academia",
    ),
    AnimeReleaseModel(
      imagePath: "assets/images/Volume_29 1.png",
      title: "Solo Leveling",
    ),
  ];
  final List<AnimeComingModel> AnimeComingModels = [
    AnimeComingModel(imagePath: "assets/images/image.png", title: "DICE"),
    AnimeComingModel(
      imagePath:
          "assets/images/Kim_Carnby_and_Hwang_Young-chan_-_Sweet_Home_vol.png",
      title: "Sweet Home",
    ),
    AnimeComingModel(
      imagePath: "assets/images/Tower_of_God_Volume_1_Cover.png",
      title: "Tower of God",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final myColors = Theme.of(context).extension<AppColors>()!;

    return Scaffold(
      backgroundColor: myColors.bg,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              MyAppBar(name: "Yoann E."),
              Row(
                children: [
                  SizedBox(width: 15, height: 90),
                  Text(
                    "Most Popular",
                    style: TextStyle(
                      color: myColors.tertiary,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 200,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: animeModels.length,
                  itemBuilder: (context, index) {
                    return MyCardAnim(animeModel: animeModels[index]);
                  },
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsetsGeometry.only(left: 10),
                    child: Text(
                      "Recent Release",
                      style: TextStyle(
                        color: myColors.tertiary,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'See more',
                      style: TextStyle(color: myColors.primary),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 280,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: AnimeReleaseModels.length,
                  itemBuilder: (context, index) {
                    return MyAnimRelease(
                      animeReleaseModel: AnimeReleaseModels[index],
                    );
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsetsGeometry.only(left: 10),
                    child: Text(
                      "Coming Soon",
                      style: TextStyle(
                        color: myColors.tertiary,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'See more',
                      style: TextStyle(color: myColors.primary),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 280,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: AnimeComingModels.length,
                  itemBuilder: (context, index) {
                    return MyAnimRelease(
                      animeReleaseModel: AnimeComingModels[index],
                    );
                  },
                ),
              ),
              SizedBox(height: 70),
            ],
          ),
        ),
      ),
    );
  }
}
