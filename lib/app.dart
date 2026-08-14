import 'package:app/pages/home_page.dart';
import 'package:app/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:simple_floating_bottom_nav_bar/floating_bottom_nav_bar.dart';
import 'package:simple_floating_bottom_nav_bar/floating_item.dart';

class MyAppPage extends StatefulWidget {
  const MyAppPage({super.key});

  @override
  State<MyAppPage> createState() => _MyAppPageState();
}

class _MyAppPageState extends State<MyAppPage> {
  // Clé du Navigator imbriqué de l'onglet Home. Elle permet de piloter
  // ce Navigator depuis l'extérieur (ex: pour gérer le bouton retour Android).
  final GlobalKey<NavigatorState> _homeNavigatorKey =
      GlobalKey<NavigatorState>();

  List<FloatingBottomNavItem> bottomNavItems = const [
    FloatingBottomNavItem(
      inactiveIcon: Icon(Icons.home_outlined, color: Colors.white),
      activeIcon: Icon(Icons.home),
    ),
    FloatingBottomNavItem(
      inactiveIcon: Icon(Icons.favorite_outline, color: Colors.white),
      activeIcon: Icon(Icons.favorite),
    ),
    FloatingBottomNavItem(
      inactiveIcon: Icon(Icons.explore_outlined, color: Colors.white),
      activeIcon: Icon(Icons.explore),
    ),
  ];

  // pages[0] n'est plus MyHomePage() directement, mais un Navigator qui
  // CONTIENT MyHomePage(). Tout ce qui est poussé depuis la home (via
  // Navigator.of(context).push(...)) restera à l'intérieur de ce
  // Navigator imbriqué, donc sous la bottom bar — au lieu de recouvrir
  // tout l'écran comme avec le Navigator racine.
  late final List<Widget> pages = [
    Navigator(
      key: _homeNavigatorKey,
      onGenerateRoute: (settings) {
        return MaterialPageRoute(builder: (_) => const MyHomePage());
      },
    ),
    Container(color: Colors.purple),
    Container(color: Colors.purple),
  ];

  @override
  Widget build(BuildContext context) {
    final myColors = Theme.of(context).extension<AppColors>()!;

    return PopScope(
      // Si le Navigator imbriqué de la home peut encore "pop" (l'utilisateur
      // est sur MyShowPage par exemple), on intercepte le bouton retour
      // Android pour popper CE Navigator-là plutôt que de fermer l'app.
      canPop: !(_homeNavigatorKey.currentState?.canPop() ?? false),
      onPopInvoked: (didPop) {
        if (!didPop) {
          _homeNavigatorKey.currentState?.pop();
        }
      },
      child: Scaffold(
        body: FloatingBottomNavBar(
          pages: pages,
          items: bottomNavItems,
          initialPageIndex: 0,
          backgroundColor: myColors.primary,
          bottomPadding: 10,
          elevation: 0,
          radius: 100,
          width: 296,
          height: 55,
        ),
      ),
    );
  }
}
