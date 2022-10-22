import 'package:flutter/material.dart';

class PlayPauseButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Icon icon;
  final Widget label;

  PlayPauseButton({
    required this.onPressed,
    required this.icon,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      onPressed: () async {
        onPressed();
      },
      icon: icon,
      label: label,
    );
  }
}
