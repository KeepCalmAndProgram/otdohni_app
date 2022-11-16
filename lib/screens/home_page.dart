/*import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:otdohni_app/widgets/relax_phrases_generator/phrase_generator.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final CountDownController _controller = CountDownController();
  final int _duration = 10;
  bool _isAnimating = false;
  bool _isStart = true;
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
            PhraseAutoGenerator(),
            CircularCountDownTimer(
              duration: _duration,
              initialDuration: 0,
              controller: _controller,
              width: MediaQuery.of(context).size.width / 1.3,
              height: MediaQuery.of(context).size.height / 1.3,
              ringColor: Theme.of(context).colorScheme.background,
              fillColor: Theme.of(context).colorScheme.primary,
              backgroundColor: Theme.of(context).colorScheme.background,
              strokeWidth: 24.0,
              strokeCap: StrokeCap.round,
              textStyle: Theme.of(context).textTheme.headline4,
              textFormat: CountdownTextFormat.MM_SS,
              isReverse: true,
              isReverseAnimation: true,
              isTimerTextShown: true,
              autoStart: false,
              onStart: () {
                setState(() {
                  _isStart = false;
                  _isAnimating = true;
                });
              },
              onComplete: () {
                setState(() {
                  _isStart = true;
                  _isAnimating = false;
                });
              },
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          if (_isAnimating) {
            _controller.pause();
            setState(() {
              _isAnimating = false;
            });
          } else {
            _isStart ? _controller.start() : _controller.resume();
            setState(() {
              _isAnimating = true;
            });
          }
        },
        icon: Icon(
          _isAnimating ? Icons.pause : Icons.play_arrow,
        ),
        label: Text(
          _isAnimating
              ? AppLocalizations.of(context)!.pause_btn_label
              : AppLocalizations.of(context)!.play_btn_label,
        ),
      ),
    );
  }
}*/

import 'dart:math';

import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:duration_picker/duration_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:otdohni_app/widgets/relax_phrases_generator/phrase_generator.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final CountDownController _controller = CountDownController();

  bool _isStart = true;
  bool _isAnimating = false;
  bool _isBack = false;

  Duration _durationPicker = Duration(hours: 0, minutes: 0);

  final int _duration = 0;
  double angle = 0;

  void _flip() {
    setState(() {
      angle = (angle + pi) % (2 * pi);
    });
  }

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
            GestureDetector(
              onTap: _isStart ? _flip : null,
              child: TweenAnimationBuilder(
                tween: Tween<double>(begin: 0, end: angle),
                duration: Duration(seconds: 1),
                curve: Curves.easeInOutBack,
                builder: (BuildContext context, double val, __) {
                  if (val >= (pi / 2)) {
                    _isBack = true;
                  } else {
                    _isBack = false;
                  }
                  return Transform(
                    alignment: Alignment.center,
                    transform: Matrix4.identity()
                      ..setEntry(3, 2, 0.001)
                      ..rotateY(val),
                    child: Container(
                      width: 300, //nado pomenat
                      height: 300, //nado pomenat
                      child: !_isBack
                          ? CircularCountDownTimer(
                              duration: _durationPicker.inSeconds,
                              initialDuration: 0,
                              controller: _controller,
                              width: MediaQuery.of(context).size.width / 1.3,
                              height: MediaQuery.of(context).size.height / 1.3,
                              ringColor: Colors.grey,
                              fillColor: Theme.of(context).colorScheme.primary,
                              backgroundColor:
                                  Theme.of(context).colorScheme.background,
                              strokeWidth: 24.0,
                              strokeCap: StrokeCap.round,
                              textStyle: Theme.of(context).textTheme.headline4,
                              textFormat: CountdownTextFormat.MM_SS,
                              isReverse: true,
                              isReverseAnimation: true,
                              isTimerTextShown: true,
                              autoStart: false,
                              onStart: () {
                                setState(() {
                                  _isStart = false;
                                  _isAnimating = true;
                                });
                              },
                              onComplete: () {
                                setState(() {
                                  _isStart = true;
                                  _isAnimating = false;
                                });
                              },
                            )
                          : Transform(
                              alignment: Alignment.center,
                              transform: Matrix4.identity()..rotateY(pi),
                              child: DurationPicker(
                                width: MediaQuery.of(context).size.width / 1.3,
                                height:
                                    MediaQuery.of(context).size.height / 1.3,
                                duration: _durationPicker,
                                onChange: (val) {
                                  setState(() => _durationPicker = val);
                                },
                                snapToMins: 5.0,
                              ),
                            ),
                    ),
                  );
                },
              ),
            ),
            PhraseAutoGenerator(),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          if (_isBack) {
            _flip();
            await Future.delayed(const Duration(seconds: 1));
            _controller.start();
            setState(() {
              _isAnimating = true;
            });
          } else {
            if (_isAnimating) {
              _controller.pause();
//              _controller.restart(duration: 0);
              setState(() {
                _isAnimating = false;
              });
            } else {
              if (_durationPicker.inSeconds == 0) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    behavior: SnackBarBehavior.floating,
                    content: Text(
                      'First choose time for rest',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.onBackground),
                    ),
                  ),
                );
              } else {
                _controller.resume();
                setState(() {
                  _isAnimating = true;
                });
              }
            }
          }
        },
        icon: Icon(
          _isAnimating ? Icons.pause : Icons.play_arrow,
        ),
        label: Text(
          _isAnimating
              ? AppLocalizations.of(context)!.pause_btn_label
              : AppLocalizations.of(context)!.play_btn_label,
        ),
      ),
    );
  }
}
