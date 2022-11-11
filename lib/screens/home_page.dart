import 'package:circular_countdown_timer/circular_countdown_timer.dart';
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
}
