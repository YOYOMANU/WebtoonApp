import 'package:app/app.dart';
import 'package:app/themes/app_colors.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        extensions: const <ThemeExtension<dynamic>>[
          AppColors(
            primary: Color(0xFFDA0033),
            secondary: Color(0xFF444444),
            tertiary: Color(0xFFEDEDED),
            bg: Color(0xFF171717),
          ),
        ],
      ),
      home: MyAppPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
