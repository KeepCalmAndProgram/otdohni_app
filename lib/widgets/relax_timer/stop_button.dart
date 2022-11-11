import 'package:flutter/material.dart';

class StopButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Icon icon;

  StopButton({
    required this.onPressed,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () async {
        onPressed();
      },
      child: icon,
    );
  }
}
