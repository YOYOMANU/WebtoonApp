# WebtoonApp

Application mobile Flutter de lecture de mangas / webtoons, avec une dimension communautaire (favoris, découverte, notation).

> 🎨 Maquette Figma : [Manga - Webtoon App (Community)](https://www.figma.com/design/8azrFozezkb5XIBq7ZLIP1/Manga---Webtoon-App--Community-)

## ✨ Fonctionnalités

- **Accueil** — parcourir le catalogue de mangas/webtoons.
- **Favoris** — retrouver les titres suivis.
- **Explorer** — découverte de nouveaux titres.
- **Fiche détail d'une série** — couverture, synopsis, note, nombre de vues, et liste des chapitres, avec un header qui se réduit élégamment au scroll (image + card d'info qui s'estompent en fondu, remplacés par une barre de titre compacte).
- **Navigation par bottom bar flottante**, persistante même lors de la navigation vers une fiche détail (grâce à un `Navigator` imbriqué par onglet).

## 🛠️ Stack technique

- **Flutter** / Dart
- [`simple_floating_bottom_nav_bar`](https://pub.dev/packages/simple_floating_bottom_nav_bar) pour la navigation par onglets flottante
- Système de design via `ThemeExtension` (`AppColors`) pour centraliser la palette de couleurs et permettre des transitions animées entre thèmes (clair/sombre à terme)
- `Sliver` / `CustomScrollView` pour les headers collapsants animés

## 📁 Structure du projet

```
lib/
├── models/         # Modèles de données (ex: ChapterModel)
├── pages/          # Écrans de l'application (home, show/détail, app shell)
├── themes/         # Design tokens (AppColors, ThemeExtension)
├── widgets/         # Composants réutilisables (ex: MyChapter)
└── main.dart
```

## 🚀 Lancer le projet

```bash
flutter pub get
flutter run
```

## 🗺️ Roadmap

- [ ] Connecter une vraie source de données (actuellement les chapitres/infos de série sont en dur dans le code)
- [ ] Implémenter les écrans Favoris et Explorer (actuellement des placeholders)
- [ ] Système de compte / communauté (avis, favoris synchronisés)
- [ ] Thème sombre (le `lerp` de `AppColors` est déjà prêt pour ça)

## 📐 Design

Le design suit la maquette Figma ci-dessus. Les tokens de couleur (`AppColors`) sont centralisés dans `lib/themes/` pour rester synchronisés avec les styles définis dans Figma.