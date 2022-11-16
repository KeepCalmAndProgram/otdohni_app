import 'package:flutter/material.dart';
import 'package:otdohni_app/screens/emoji_screen.dart';
import 'package:otdohni_app/screens/home_page.dart';
import 'package:otdohni_app/screens/stats_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController();
    return PageView(
      controller: controller,
      children: [
        HomePage(),
        EmojiScreen(),
        StatsScreen(),
        StatsScreen(),
      ],
    );
  }
}
