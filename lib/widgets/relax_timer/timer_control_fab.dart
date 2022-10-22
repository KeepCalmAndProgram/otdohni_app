import 'package:flutter/material.dart';
import 'package:otdohni_app/widgets/relax_timer/play_pause_button.dart';
import 'package:otdohni_app/widgets/relax_timer/stop_button.dart';

class TimerControlFloatingActionButton extends StatelessWidget {
  /// _isBack
  /// _controller
  /// _isAnimating
  /// _duartionPicker
  /// AppLocalizations
  final ValueNotifier isBack;

  TimerControlFloatingActionButton({
    required this.isBack,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // PlayPauseButton(),
        StopButton(onPressed: () {}, icon: const Icon(Icons.stop))
      ],
    );
  }
}
