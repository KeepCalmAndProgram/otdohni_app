import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:otdohni_app/widgets/emoji_animation.dart';
import 'package:otdohni_app/widgets/relax_phrases_generator/phrase_generator.dart';

class EmojiScreen extends StatefulWidget {
  const EmojiScreen({Key? key}) : super(key: key);

  @override
  State<EmojiScreen> createState() => _EmojiScreenState();
}

class _EmojiScreenState extends State<EmojiScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.appbar_home_title),
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.assessment_outlined,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.settings,
            ),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            EmojiAnimation(),
            PhraseAutoGenerator(),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // there myst be a navigation logic
        },
        label: Text('Start The Rest'),
      ),
    );
  }
}
