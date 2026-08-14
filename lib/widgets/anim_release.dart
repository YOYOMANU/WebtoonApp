import 'package:app/models/anime_release_model.dart';
import 'package:app/themes/app_colors.dart';
import 'package:flutter/material.dart';

class MyAnimRelease extends StatelessWidget {
  const MyAnimRelease({super.key, required this.animeReleaseModel});
  final AnimeReleaseModel animeReleaseModel;

  @override
  Widget build(BuildContext context) {
    final myColors = Theme.of(context).extension<AppColors>()!;

    return SizedBox(
      child: Column(
        children: [
          Card(
            clipBehavior: Clip.antiAlias,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadiusGeometry.circular(20),
            ),
            child: Image.asset(animeReleaseModel.imagePath),
          ),
          SizedBox(height: 5),
          Text(
            animeReleaseModel.title,
            style: TextStyle(color: myColors.tertiary),
          ),
        ],
      ),
    );
  }
}
