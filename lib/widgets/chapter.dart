import 'package:app/models/chapter_model.dart';
import 'package:app/themes/app_colors.dart';
import 'package:flutter/material.dart';

class MyChapter extends StatelessWidget {
  const MyChapter({super.key, required this.chapterModel});

  final ChapterModel chapterModel;

  @override
  Widget build(BuildContext context) {
    final myColors = Theme.of(context).extension<AppColors>()!;
    return ListTile(
      minLeadingWidth: 80,
      leading: ClipRRect(
        clipBehavior: Clip.antiAlias,
        borderRadius: BorderRadius.circular(5),
        child: SizedBox(
          width: 80,
          height: 80,
          child: Image.asset(chapterModel.imagePath, fit: .cover),
        ),
      ),
      title: Text(
        chapterModel.title,
        style: TextStyle(color: myColors.tertiary),
      ),
      subtitle: Text(
        chapterModel.subtitle,
        style: TextStyle(
          color: myColors.primary,
          fontSize: 18,
          fontWeight: .bold,
        ),
      ),
    );
  }
}
