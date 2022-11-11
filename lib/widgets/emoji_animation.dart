import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EmojiAnimation extends StatefulWidget {
  List<String> emoji = [
    'assets/emoji1.png',
    'assets/emoji2.png',
    'assets/emoji3.png',
    'assets/emoji4.png',
    'assets/emoji5.png',
    'assets/emoji6.png',
    'assets/emoji7.png',
  ];

  EmojiAnimation({Key? key}) : super(key: key);

  @override
  State<EmojiAnimation> createState() => _EmojiAnimationState();
}

class _EmojiAnimationState extends State<EmojiAnimation> {
  int _index = 0;
  late Timer _timer;

  @override
  void initState() {
    _timer = Timer.periodic(new Duration(seconds: 5), (Timer timer) {
      setState(() {
        _index = (_index + 1) % widget.emoji.length;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: MediaQuery.of(context).size.height / 2,
        width: MediaQuery.of(context).size.width / 1.4,
        child: Image(
          image: AssetImage(widget.emoji[_index]),
          fit: BoxFit.cover,
        ),
        color: Colors.lightBlue,
      ),
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    //_timer = null;
    super.dispose();
  }
}
