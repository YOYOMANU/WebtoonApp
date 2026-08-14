import 'package:app/themes/app_colors.dart';
import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({super.key, required this.name});
  final String name;

  @override
  Widget build(BuildContext context) {
    final myColors = Theme.of(context).extension<AppColors>()!;
    return Column(
      children: [
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: .spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  width: 48,
                  height: 48,
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.only(left: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: myColors.primary,
                  ),
                  child: Icon(
                    Icons.person_outline_sharp,
                    color: myColors.tertiary,
                  ),
                ),
                SizedBox(width: 10),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Good morning",
                      style: TextStyle(color: myColors.tertiary, fontSize: 12),
                    ),
                    Text(
                      name,
                      style: TextStyle(
                        color: myColors.primary,
                        fontSize: 16,
                        fontWeight: .bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.search_outlined, color: myColors.tertiary),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.notifications_outlined,
                    color: myColors.tertiary,
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
