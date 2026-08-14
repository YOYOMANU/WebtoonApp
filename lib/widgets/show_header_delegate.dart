import 'package:app/themes/app_colors.dart';
import 'package:flutter/material.dart';

double _lerp(double a, double b, double t) => a + (b - a) * t;

/// Delegate qui dessine l'image, la card flottante et le bouton flèche,
/// et les fait rétrécir/disparaître progressivement selon [shrinkOffset].
class ShowHeaderDelegate extends SliverPersistentHeaderDelegate {
  ShowHeaderDelegate({
    required this.colors,
    required this.synopsis,
    required this.onBack,
  });

  final AppColors colors;
  final String synopsis;
  final VoidCallback onBack;

  // Hauteur au repos (avant scroll) : identique au design original.
  static const double _maxHeight = 430;
  // Hauteur une fois complètement réduit (juste la barre avec titre + icônes).
  static const double _minHeight = 100;

  @override
  double get maxExtent => _maxHeight;

  @override
  double get minExtent => _minHeight;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    // t = 0 -> état initial (avant scroll), t = 1 -> complètement réduit
    final t = (shrinkOffset / (_maxHeight - _minHeight)).clamp(0.0, 1.0);

    final imageHeight = _lerp(320, _minHeight, t);

    // La card (et le bouton) s'estompent en fondu sur les 35% premiers du
    // scroll, en glissant légèrement vers le haut. On ne les rétrécit plus :
    // ils gardent leur taille d'origine tant qu'ils sont visibles, puis
    // disparaissent complètement (donc plus de risque d'overflow).
    final cardFade = (t / 0.35).clamp(0.0, 1.0);
    final cardOpacity = 1 - cardFade;
    final cardTranslateY = _lerp(0, -24, cardFade);

    final buttonOpacity = (1 - t / 0.2).clamp(0.0, 1.0);

    // Une fois la card quasiment partie, le titre apparaît en fondu dans
    // la barre du haut, comme une toolbar qui se recompose au scroll.
    final collapsedTitleOpacity = ((t - 0.55) / 0.45).clamp(0.0, 1.0);

    return SizedBox(
      height: _maxHeight,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          // Image de couverture qui rétrécit
          SizedBox(
            height: imageHeight,
            width: double.infinity,
            child: Stack(
              children: [
                Image.asset(
                  "assets/images/one-piece-covers1.png",
                  width: double.infinity,
                  height: imageHeight,
                  fit: BoxFit.cover,
                ),
                Container(
                  width: double.infinity,
                  height: imageHeight,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.black.withValues(alpha: 0.5),
                        Colors.transparent,
                      ],
                      stops: const [0.0, 0.4],
                    ),
                  ),
                ),
                SafeArea(
                  child: SizedBox(
                    height: 48,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        // Titre qui apparaît une fois la card disparue
                        if (collapsedTitleOpacity > 0)
                          Opacity(
                            opacity: collapsedTitleOpacity,
                            child: Text(
                              "One Piece",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                onPressed: onBack,
                                icon: const Icon(
                                  Icons.arrow_back,
                                  color: Colors.white,
                                ),
                              ),
                              Row(
                                children: [
                                  IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.favorite_outline,
                                      color: Colors.white,
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.share_outlined,
                                      color: Colors.white,
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
                ),
              ],
            ),
          ),

          // Card flottante : disparaît en fondu au scroll, taille fixe
          if (cardOpacity > 0)
            Positioned(
              top: 250,
              left: 0,
              right: 0,
              child: Center(
                child: Transform.translate(
                  offset: Offset(0, cardTranslateY),
                  child: Opacity(
                    opacity: cardOpacity,
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width - 40,
                      height: 160,
                      child: Card(
                        elevation: 10,
                        color: colors.bg,
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "One Piece",
                                    style: TextStyle(
                                      fontSize: 24,
                                      color: colors.tertiary,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Row(
                                        children: [
                                          const Icon(
                                            Icons.star,
                                            color: Colors.amber,
                                            size: 18,
                                          ),
                                          Text(
                                            " 7.9",
                                            style: TextStyle(
                                              color: colors.tertiary,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(width: 10),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.remove_red_eye_outlined,
                                            color: colors.tertiary,
                                            size: 18,
                                          ),
                                          Text(
                                            " 89,200",
                                            style: TextStyle(
                                              color: colors.tertiary,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 4),
                                child: Text(
                                  "Synopsis",
                                  style: TextStyle(color: colors.tertiary),
                                ),
                              ),
                              Text(
                                synopsis,
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(color: colors.tertiary),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),

          // Bouton flèche vers le bas : disparaît très vite dès le début du scroll
          if (buttonOpacity > 0)
            Positioned(
              top: 380,
              left: 150,
              child: Opacity(
                opacity: buttonOpacity,
                child: Container(
                  decoration: BoxDecoration(
                    color: colors.primary,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.arrow_downward, color: colors.tertiary),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  @override
  bool shouldRebuild(covariant ShowHeaderDelegate oldDelegate) {
    return oldDelegate.colors != colors ||
        oldDelegate.synopsis != synopsis ||
        oldDelegate.onBack != onBack;
  }
}
