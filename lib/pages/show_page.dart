import 'package:app/models/chapter_model.dart';
import 'package:app/themes/app_colors.dart';
import 'package:app/widgets/chapter.dart';
import 'package:app/widgets/show_header_delegate.dart';
import 'package:flutter/material.dart';

class MyShowPage extends StatefulWidget {
  const MyShowPage({super.key});

  @override
  State<MyShowPage> createState() => _MyShowPageState();
}

class _MyShowPageState extends State<MyShowPage> {
  final String synopsis =
      "L'histoire suit les aventures de Monkey D. Luffy, un garçon dont le corps a acquis les propriétés du caoutchouc après avoir mangé par inadvertance un fruit du démon. Avec son équipage de pirates, appelé l'équipage de Chapeau de paille, Luffy explore Grand Line à la recherche du trésor ultime connu sous le nom de « One Piece » afin de devenir le prochain roi des pirates.";

  final List<ChapterModel> chapterModels = [
    ChapterModel(
      imagePath: "assets/images/op_1067_punk_001.png",
      title: "Chapiter 167",
      subtitle: "PUNK Record",
    ),
    ChapterModel(
      imagePath: "assets/images/op_1066_ohara_001.png",
      title: "Chapiter 166",
      subtitle: "The Will of Ohara",
    ),
    ChapterModel(
      imagePath: "assets/images/op_1065_faces_016.png",
      title: "Chapiter 165",
      subtitle: "Six Vegapunks",
    ),
    ChapterModel(
      imagePath: "assets/images/op_1065_faces_016.png",
      title: "Chapiter 165",
      subtitle: "Six Vegapunks",
    ),
    ChapterModel(
      imagePath: "assets/images/op_1065_faces_016.png",
      title: "Chapiter 165",
      subtitle: "Six Vegapunks",
    ),
    ChapterModel(
      imagePath: "assets/images/op_1065_faces_016.png",
      title: "Chapiter 165",
      subtitle: "Six Vegapunks",
    ),
    ChapterModel(
      imagePath: "assets/images/op_1065_faces_016.png",
      title: "Chapiter 165",
      subtitle: "Six Vegapunks",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final myColors = Theme.of(context).extension<AppColors>()!;

    return Scaffold(
      backgroundColor: myColors.bg,
      body: CustomScrollView(
        slivers: [
          // Header collapsant : image + card flottante + bouton flèche
          SliverPersistentHeader(
            pinned: true, // reste épinglé en haut au lieu de disparaître
            delegate: ShowHeaderDelegate(
              colors: myColors,
              synopsis: synopsis,
              onBack: () => Navigator.pop(context),
            ),
          ),

          // Liste des chapitres
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(16, 24, 16, 16),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                Text(
                  "Chapters",
                  style: TextStyle(
                    color: myColors.tertiary,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                ...chapterModels.map((chapter) {
                  return Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    decoration: BoxDecoration(
                      border: Border.all(color: myColors.primary, width: 1.5),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: MyChapter(chapterModel: chapter),
                  );
                }),
                SizedBox(height: 60),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
