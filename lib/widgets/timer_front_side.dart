import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';

class TimerFrontSide extends StatefulWidget {
  final bool isStart;
  final bool isAnimating;
  final CountDownController controller;

  TimerFrontSide({
    required this.isStart,
    required this.isAnimating,
    required this.controller,
  });

  @override
  _TimerFrontSideState createState() => _TimerFrontSideState();
}

class _TimerFrontSideState extends State<TimerFrontSide> {
  bool _isAnimating = false;
  bool _isStart = true;

  late CountDownController _controller;
  final int _duration = 0;

  @override
  void initState() {
    super.initState();
    _isStart = widget.isStart;
    _isAnimating = widget.isAnimating;
    _controller = widget.controller;
  }

  void timerFrontSideAnimatingCheck() {
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
  }

  @override
  Widget build(BuildContext context) {
    return CircularCountDownTimer(
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
    );
  }
}
