import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:otdohni_app/widgets/emoji_animation.dart';

class EmojiScreen extends StatefulWidget {
  const EmojiScreen({Key? key}) : super(key: key);

  @override
  State<EmojiScreen> createState() => _EmojiScreenState();
}

class _EmojiScreenState extends State<EmojiScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          EmojiAnimation(),
        ],
      ),
    );
  }
}
