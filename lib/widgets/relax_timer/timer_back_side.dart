import 'dart:math';

import 'package:duration_picker/duration_picker.dart';
import 'package:flutter/material.dart';

class TimerBackSide extends StatefulWidget {
  const TimerBackSide({Key? key}) : super(key: key);

  @override
  _TimerBackSideState createState() => _TimerBackSideState();
}

class _TimerBackSideState extends State<TimerBackSide> {
  Duration _durationPicker = Duration(hours: 0, minutes: 0);

  void timerBackSideDurationPicker() {
    DurationPicker(
      onChange: (value) {
        setState(() {
          _durationPicker = value;
        });
      },
      snapToMins: 5,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Transform(
      alignment: Alignment.center,
      transform: Matrix4.identity()..rotateY(pi),
      child: Expanded(
        child: DurationPicker(
          duration: _durationPicker,
          onChange: (val) {
            setState(() => _durationPicker = val);
          },
          snapToMins: 5.0,
        ),
      ),
    );
  }
}
