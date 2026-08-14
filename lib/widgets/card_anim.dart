import 'package:app/models/anime_model.dart';
import 'package:app/pages/show_page.dart';
import 'package:app/themes/app_colors.dart';
import 'package:flutter/material.dart';

class MyCardAnim extends StatelessWidget {
  const MyCardAnim({super.key, required this.animeModel});

  final AnimeModel animeModel;

  @override
  Widget build(BuildContext context) {
    final myColors = Theme.of(context).extension<AppColors>()!;

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MyShowPage()),
        );
      },
      child: Card(
        clipBehavior: Clip.antiAlias, // ← solution la plus simple
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Stack(
          children: [
            Container(
              width: 296,
              height: 200,
              child: Image.asset(animeModel.imagePath, fit: BoxFit.cover),
            ),
            Container(
              width: 296,
              height: 200,
              color: Colors.black.withValues(alpha: 0.4), // ← assombrit
            ),
            Positioned(
              bottom: 30,
              left: 10,
              child: Column(
                children: [
                  Text(
                    animeModel.title,
                    style: TextStyle(
                      color: myColors.tertiary,
                      fontSize: 24,
                      fontWeight: .bold,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: .start,
                    children: [
                      Icon(Icons.star, color: Colors.amber),
                      Text(
                        animeModel.countStars.toString(),
                        style: TextStyle(
                          color: myColors.tertiary,
                          fontSize: 12,
                        ),
                      ),
                      Text(
                        animeModel.chapter,
                        style: TextStyle(
                          color: myColors.tertiary,
                          fontSize: 12,
                        ),
                      ),
                    ],
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
