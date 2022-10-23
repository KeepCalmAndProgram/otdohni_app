import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'fade_in.dart';

class PhraseAutoGenerator extends StatefulWidget {
  const PhraseAutoGenerator({Key? key}) : super(key: key);

  @override
  _PhraseAutoGeneratorState createState() => _PhraseAutoGeneratorState();
}

class _PhraseAutoGeneratorState extends State<PhraseAutoGenerator> {
  int _phraseIndex = 0;
  late List<String> _phraseList;

  @override
  void didChangeDependencies() {
    _fillPhraseList();
    _phraseList.shuffle();

    super.didChangeDependencies();
  }

  void _fillPhraseList() {
    _phraseList = [
      AppLocalizations.of(context)!.phrase1,
      AppLocalizations.of(context)!.phrase2,
      AppLocalizations.of(context)!.phrase3,
      AppLocalizations.of(context)!.phrase4,
      AppLocalizations.of(context)!.phrase5,
      AppLocalizations.of(context)!.phrase6,
      AppLocalizations.of(context)!.phrase7,
      AppLocalizations.of(context)!.phrase8,
      AppLocalizations.of(context)!.phrase9,
      AppLocalizations.of(context)!.phrase10,
      AppLocalizations.of(context)!.phrase11,
      AppLocalizations.of(context)!.phrase12,
    ];
  }

  @override
  Widget build(BuildContext context) {
    return FadeInOut(
      fadeCompleteCallback: () {
        setState(() {
          _phraseIndex = _phraseIndex != _phraseList.length - 1
              ? ++_phraseIndex
              : _phraseIndex = 0;
        });
      },
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        color: Theme.of(context).colorScheme.background,
        child: Text(
          _phraseList[_phraseIndex],
          style: TextStyle(
            color: Theme.of(context).colorScheme.onBackground,
            fontSize: 18.0,
            fontWeight: FontWeight.w700,
          ),
          softWrap: true,
          textAlign: TextAlign.center,
          overflow: TextOverflow.visible,
        ),
      ),
    );
  }
}
